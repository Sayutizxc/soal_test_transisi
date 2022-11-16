import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/models/employee_model.dart';

part '../../../generated/features/list_employee/models/list_employee_model.freezed.dart';
part '../../../generated/features/list_employee/models/list_employee_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ListEmployeeModel with _$ListEmployeeModel {
  factory ListEmployeeModel({
    int? page,
    int? perPage,
    int? total,
    int? totalPage,
    List<EmployeeModel>? data,
  }) = _ListEmployeeModel;

  factory ListEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$ListEmployeeModelFromJson(json);
}
