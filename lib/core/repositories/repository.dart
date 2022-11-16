import 'package:dio/dio.dart';

abstract class Repository {
  abstract final Dio client;
}
