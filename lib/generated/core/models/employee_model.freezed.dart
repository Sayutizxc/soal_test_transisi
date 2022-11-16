// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../core/models/employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeeModel {
  @JsonStringToInt()
  int? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get job => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get isFavofite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
  @useResult
  $Res call(
      {@JsonStringToInt() int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? avatar,
      String? job,
      String? website,
      String? phoneNumber,
      bool? isFavofite});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? job = freezed,
    Object? website = freezed,
    Object? phoneNumber = freezed,
    Object? isFavofite = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavofite: freezed == isFavofite
          ? _value.isFavofite
          : isFavofite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeModelCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$_EmployeeModelCopyWith(
          _$_EmployeeModel value, $Res Function(_$_EmployeeModel) then) =
      __$$_EmployeeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonStringToInt() int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? avatar,
      String? job,
      String? website,
      String? phoneNumber,
      bool? isFavofite});
}

/// @nodoc
class __$$_EmployeeModelCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$_EmployeeModel>
    implements _$$_EmployeeModelCopyWith<$Res> {
  __$$_EmployeeModelCopyWithImpl(
      _$_EmployeeModel _value, $Res Function(_$_EmployeeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? avatar = freezed,
    Object? job = freezed,
    Object? website = freezed,
    Object? phoneNumber = freezed,
    Object? isFavofite = freezed,
  }) {
    return _then(_$_EmployeeModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      job: freezed == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isFavofite: freezed == isFavofite
          ? _value.isFavofite
          : isFavofite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeModel implements _EmployeeModel {
  _$_EmployeeModel(
      {@JsonStringToInt() this.id,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      this.job,
      this.website,
      this.phoneNumber = "(999) 999 999",
      this.isFavofite = false});

  factory _$_EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeModelFromJson(json);

  @override
  @JsonStringToInt()
  final int? id;
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? avatar;
  @override
  final String? job;
  @override
  final String? website;
  @override
  @JsonKey()
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool? isFavofite;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar, job: $job, website: $website, phoneNumber: $phoneNumber, isFavofite: $isFavofite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isFavofite, isFavofite) ||
                other.isFavofite == isFavofite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, firstName, lastName,
      avatar, job, website, phoneNumber, isFavofite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      __$$_EmployeeModelCopyWithImpl<_$_EmployeeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeModelToJson(
      this,
    );
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  factory _EmployeeModel(
      {@JsonStringToInt() final int? id,
      final String? email,
      final String? firstName,
      final String? lastName,
      final String? avatar,
      final String? job,
      final String? website,
      final String? phoneNumber,
      final bool? isFavofite}) = _$_EmployeeModel;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$_EmployeeModel.fromJson;

  @override
  @JsonStringToInt()
  int? get id;
  @override
  String? get email;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get avatar;
  @override
  String? get job;
  @override
  String? get website;
  @override
  String? get phoneNumber;
  @override
  bool? get isFavofite;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
