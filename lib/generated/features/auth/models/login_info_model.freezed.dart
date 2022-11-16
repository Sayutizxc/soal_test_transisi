// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../features/auth/models/login_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginInfoModel _$LoginInfoModelFromJson(Map<String, dynamic> json) {
  return _LoginInfoModel.fromJson(json);
}

/// @nodoc
mixin _$LoginInfoModel {
  String? get token => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginInfoModelCopyWith<LoginInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInfoModelCopyWith<$Res> {
  factory $LoginInfoModelCopyWith(
          LoginInfoModel value, $Res Function(LoginInfoModel) then) =
      _$LoginInfoModelCopyWithImpl<$Res, LoginInfoModel>;
  @useResult
  $Res call({String? token, String? error});
}

/// @nodoc
class _$LoginInfoModelCopyWithImpl<$Res, $Val extends LoginInfoModel>
    implements $LoginInfoModelCopyWith<$Res> {
  _$LoginInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginInfoModelCopyWith<$Res>
    implements $LoginInfoModelCopyWith<$Res> {
  factory _$$_LoginInfoModelCopyWith(
          _$_LoginInfoModel value, $Res Function(_$_LoginInfoModel) then) =
      __$$_LoginInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, String? error});
}

/// @nodoc
class __$$_LoginInfoModelCopyWithImpl<$Res>
    extends _$LoginInfoModelCopyWithImpl<$Res, _$_LoginInfoModel>
    implements _$$_LoginInfoModelCopyWith<$Res> {
  __$$_LoginInfoModelCopyWithImpl(
      _$_LoginInfoModel _value, $Res Function(_$_LoginInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_LoginInfoModel(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginInfoModel implements _LoginInfoModel {
  _$_LoginInfoModel({this.token, this.error});

  factory _$_LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginInfoModelFromJson(json);

  @override
  final String? token;
  @override
  final String? error;

  @override
  String toString() {
    return 'LoginInfoModel(token: $token, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInfoModel &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInfoModelCopyWith<_$_LoginInfoModel> get copyWith =>
      __$$_LoginInfoModelCopyWithImpl<_$_LoginInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginInfoModelToJson(
      this,
    );
  }
}

abstract class _LoginInfoModel implements LoginInfoModel {
  factory _LoginInfoModel({final String? token, final String? error}) =
      _$_LoginInfoModel;

  factory _LoginInfoModel.fromJson(Map<String, dynamic> json) =
      _$_LoginInfoModel.fromJson;

  @override
  String? get token;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInfoModelCopyWith<_$_LoginInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
