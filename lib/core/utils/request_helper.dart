import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:soal_test_transisi/core/utils/logging.dart';

import '../constants/error_message.dart';
import '../models/exception.dart';
import '../models/failure.dart';

/// Helper class untuk membantu melakukan request ke remote datasource.
///
/// Parameter [request] berfungsi untuk menampung metode http request yang digunakan.
/// Parameter mapper digunakan untuk mengubah data json menjadi model.
///
/// Contoh penggunaannya adalah sebagai berikut :
///
/// ```
/// RequestHelper<List<Model>,Model>().request(
///     request: () async => await client.get(path),
///     mapper: Model.fromJson,
/// );
/// ```
class RequestHelper<T extends Object, M> {
  Future<Either<Failure, T>> request({
    required Future<Response<dynamic>> Function() request,
    required M Function(Map<String, dynamic>) mapper,
  }) async {
    late T result;
    try {
      result = await _remoteDatasource(request: request, mapper: mapper);
    } on NoInternetConnectionException {
      return Left(NoInternetConnectionFailure());
    } on ServerException catch (serverError) {
      return Left(ServerFailure(info: serverError.info));
    } on UnknownException catch (unknowError) {
      return Left(UnknownFailure(info: unknowError.info));
    } catch (err) {
      return Left(UnknownFailure(info: err.toString()));
    }
    return Right(result);
  }

  Future<T> _remoteDatasource({
    required Future<Response<dynamic>> Function() request,
    required M Function(Map<String, dynamic>) mapper,
  }) async {
    final bool isConnectedToInternet = await _checkInternetConnection();
    if (!isConnectedToInternet) throw const NoInternetConnectionException();

    final response = await _tryCatch(() async => await request());
    logger.i(M.toString(), null, StackTrace.empty);
    logger.i(response.data, null, StackTrace.empty);
    try {
      return await compute(
        ParseDataHelper<T, M>().data,
        ParseDataHelperParam<T, M>(
          mapper: mapper,
          data: response.data,
        ),
      );
    } catch (e) {
      logger.e(e.toString());
      throw const ServerException(info: ErrorMessage.formatException);
    }
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  Future<Response<dynamic>> _tryCatch(
    Future<Response<dynamic>> Function() doSomething,
  ) async {
    try {
      return await doSomething();
    } on DioError catch (err) {
      if (err.error is SocketException) {
        logger.e((err.error as SocketException).message);
        throw ServerException(info: (err.error as SocketException).message);
      }

      late String? messageFromJson = _getErrorMessage(err);
      late String? messageFromStatusCode = _parseStatusCode(err.response);
      late String? statusMessage = err.response?.statusMessage;

      bool hasErrorMessage = (messageFromJson != null) ||
          (messageFromStatusCode != null) ||
          (statusMessage != null);

      if (hasErrorMessage) {
        final String errorMessage =
            messageFromJson ?? messageFromStatusCode ?? statusMessage!;
        logger.e(errorMessage, null, StackTrace.current);
        throw ServerException(info: errorMessage);
      }
      logger.e(err.message);
      throw ServerException(info: err.message);
    } catch (err) {
      logger.e(err);
      throw const UnknownException(info: ErrorMessage.unknownException);
    }
  }

  String? _getErrorMessage(DioError err) {
    try {
      if (err.response?.data?['error'] == null) return null;
      return err.response?.data?['error'] as String;
    } catch (e) {
      logger.e(err);
      return null;
    }
  }

  String? _parseStatusCode(Response<dynamic>? response) {
    switch (response?.statusCode) {
      case 400:
        return ErrorMessage.error400;
      case 401:
        return ErrorMessage.error401;
      case 404:
        return ErrorMessage.error404;
      case 500:
        return ErrorMessage.error500;
      default:
        return null;
    }
  }
}

class ParseDataHelper<T extends Object, M> {
  T data(ParseDataHelperParam<T, M> param) {
    final data = param.data;
    if (data is List) {
      return data
          .map((data) => param.mapper(data as Map<String, dynamic>))
          .toList() as T;
    }
    return param.mapper(data as Map<String, dynamic>) as T;
  }
}

class ParseDataHelperParam<T extends Object, M> {
  ParseDataHelperParam({
    this.data,
    required this.mapper,
  });

  final dynamic data;
  final M Function(Map<String, dynamic>) mapper;
}
