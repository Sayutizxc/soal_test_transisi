// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../../features/list_employee/models/list_employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListEmployeeModel _$$_ListEmployeeModelFromJson(Map<String, dynamic> json) =>
    _$_ListEmployeeModel(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPage: json['total_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ListEmployeeModelToJson(
        _$_ListEmployeeModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_page': instance.totalPage,
      'data': instance.data,
    };
