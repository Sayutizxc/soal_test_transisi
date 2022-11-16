// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/constants/api.dart';
import 'package:soal_test_transisi/core/providers/dio_provider.dart';

import '../../../core/models/failure.dart';
import '../../../core/repositories/repository.dart';
import '../../../core/utils/request_helper.dart';
import '../models/login_info_model.dart';
import '../models/login_param_model.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepositoryImpl(client: ref.watch(dioProvider));
});

abstract class LoginRepository implements Repository {
  Future<Either<Failure, LoginInfoModel>> login({required LoginParam param});
}

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required this.client,
  });

  @override
  final Dio client;

  @override
  Future<Either<Failure, LoginInfoModel>> login({
    required LoginParam param,
  }) async {
    return await RequestHelper<LoginInfoModel, LoginInfoModel>().request(
      request: () => client.post(
        EmployeeApi.login,
        data: param.toMap(),
      ),
      mapper: LoginInfoModel.fromJson,
    );
  }
}
