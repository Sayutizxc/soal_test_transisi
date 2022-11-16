import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/json_string_to_int.dart';

part '../../generated/core/models/employee_model.freezed.dart';
part '../../generated/core/models/employee_model.g.dart';

@freezed
class EmployeeModel with _$EmployeeModel {
  factory EmployeeModel({
    @JsonStringToInt() int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
    String? job,
    String? website,
    @Default("(999) 999 999") String? phoneNumber,
    @Default(false) bool? isFavofite,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
