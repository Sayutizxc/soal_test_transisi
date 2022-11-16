import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio = Dio();
  // final token = ref.watch(tokenProvider);
  // dio.options.headers = {
  //   'Authorization': 'Bearer $token',
  //   'Accept': 'application/json',
  // };
  // dio.interceptors.add(RetryOnInvalidTokenInterceptor(read: ref.read));
  return dio;
});
