// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../core/models/employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmployeeModel _$$_EmployeeModelFromJson(Map<String, dynamic> json) =>
    _$_EmployeeModel(
      id: const JsonStringToInt().fromJson(json['id']),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
      job: json['job'] as String?,
      website: json['website'] as String?,
      phoneNumber: json['phone_number'] as String? ?? "(999) 999 999",
      isFavofite: json['is_favofite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_EmployeeModelToJson(_$_EmployeeModel instance) =>
    <String, dynamic>{
      'id': _$JsonConverterToJson<dynamic, int>(
          instance.id, const JsonStringToInt().toJson),
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'job': instance.job,
      'website': instance.website,
      'phone_number': instance.phoneNumber,
      'is_favofite': instance.isFavofite,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
