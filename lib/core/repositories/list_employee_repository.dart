import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soal_test_transisi/core/models/employee_model.dart';

import '../constants/api.dart';
import '../models/failure.dart';
import '../providers/dio_provider.dart';
import 'repository.dart';
import '../utils/request_helper.dart';
import '../../features/list_employee/models/list_employee_model.dart';

final listEmployeeRepositoryProvider =
    Provider.autoDispose<ListEmployeeRepository>(
  (ref) => ListEmployeeRepositoryImpl(
    client: ref.watch(dioProvider),
  ),
);

abstract class ListEmployeeRepository implements Repository {
  Future<Either<Failure, ListEmployeeModel>> getListEmployee({int? page = 1});
  Future<Either<Failure, EmployeeModel>> createEmployee(EmployeeModel employee);
  Future<Either<Failure, EmployeeModel>> updateEmployee(EmployeeModel employee);
}

class ListEmployeeRepositoryImpl implements ListEmployeeRepository {
  const ListEmployeeRepositoryImpl({
    required this.client,
  });

  @override
  final Dio client;

  @override
  Future<Either<Failure, ListEmployeeModel>> getListEmployee({
    int? page = 1,
  }) async {
    return await RequestHelper<ListEmployeeModel, ListEmployeeModel>().request(
      request: () => client.get(
        EmployeeApi.employees,
        queryParameters: {
          "page": page,
          "per_page": 12,
        },
      ),
      mapper: ListEmployeeModel.fromJson,
    );
  }

  @override
  Future<Either<Failure, EmployeeModel>> createEmployee(
      EmployeeModel employee) async {
    /// Reqres.in tidak mendukung upload image
    /// Jika mengirimkan base64 akan mendapatkan error "Payload Too Large"
    /// Sehingga untuk keperluan simulasi maka avatar tidak akan dikirim
    /// Avatar akan ditambahkan setelah menerima data.
    final result = await RequestHelper<EmployeeModel, EmployeeModel>().request(
      request: () => client.post(
        EmployeeApi.employees,
        data: employee.copyWith(avatar: null).toJson(),
      ),
      mapper: EmployeeModel.fromJson,
    );
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.copyWith(avatar: employee.avatar)),
    );
  }

  @override
  Future<Either<Failure, EmployeeModel>> updateEmployee(
      EmployeeModel employee) async {
    /// Reqres.in tidak mendukung upload image
    /// Jika mengirimkan base64 akan mendapatkan error "Payload Too Large"
    /// Sehingga untuk keperluan simulasi maka avatar tidak akan dikirim
    /// Avatar akan ditambahkan setelah menerima data.
    final result = await RequestHelper<EmployeeModel, EmployeeModel>().request(
      request: () => client.patch(
        "${EmployeeApi.employees}/${employee.id}",
        data: employee.copyWith(avatar: null).toJson(),
      ),
      mapper: EmployeeModel.fromJson,
    );
    return result.fold(
      (error) => Left(error),
      (data) => Right(data.copyWith(avatar: employee.avatar)),
    );
  }
}
