// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../../../features/list_employee/models/list_employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListEmployeeModel _$ListEmployeeModelFromJson(Map<String, dynamic> json) {
  return _ListEmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$ListEmployeeModel {
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  int? get totalPage => throw _privateConstructorUsedError;
  List<EmployeeModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListEmployeeModelCopyWith<ListEmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListEmployeeModelCopyWith<$Res> {
  factory $ListEmployeeModelCopyWith(
          ListEmployeeModel value, $Res Function(ListEmployeeModel) then) =
      _$ListEmployeeModelCopyWithImpl<$Res, ListEmployeeModel>;
  @useResult
  $Res call(
      {int? page,
      int? perPage,
      int? total,
      int? totalPage,
      List<EmployeeModel>? data});
}

/// @nodoc
class _$ListEmployeeModelCopyWithImpl<$Res, $Val extends ListEmployeeModel>
    implements $ListEmployeeModelCopyWith<$Res> {
  _$ListEmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListEmployeeModelCopyWith<$Res>
    implements $ListEmployeeModelCopyWith<$Res> {
  factory _$$_ListEmployeeModelCopyWith(_$_ListEmployeeModel value,
          $Res Function(_$_ListEmployeeModel) then) =
      __$$_ListEmployeeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      int? perPage,
      int? total,
      int? totalPage,
      List<EmployeeModel>? data});
}

/// @nodoc
class __$$_ListEmployeeModelCopyWithImpl<$Res>
    extends _$ListEmployeeModelCopyWithImpl<$Res, _$_ListEmployeeModel>
    implements _$$_ListEmployeeModelCopyWith<$Res> {
  __$$_ListEmployeeModelCopyWithImpl(
      _$_ListEmployeeModel _value, $Res Function(_$_ListEmployeeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPage = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_ListEmployeeModel(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListEmployeeModel implements _ListEmployeeModel {
  _$_ListEmployeeModel(
      {this.page, this.perPage, this.total, this.totalPage, this.data});

  factory _$_ListEmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$$_ListEmployeeModelFromJson(json);

  @override
  final int? page;
  @override
  final int? perPage;
  @override
  final int? total;
  @override
  final int? totalPage;
  @override
  final List<EmployeeModel>? data;

  @override
  String toString() {
    return 'ListEmployeeModel(page: $page, perPage: $perPage, total: $total, totalPage: $totalPage, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListEmployeeModel &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPage,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListEmployeeModelCopyWith<_$_ListEmployeeModel> get copyWith =>
      __$$_ListEmployeeModelCopyWithImpl<_$_ListEmployeeModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListEmployeeModelToJson(
      this,
    );
  }
}

abstract class _ListEmployeeModel implements ListEmployeeModel {
  factory _ListEmployeeModel(
      {final int? page,
      final int? perPage,
      final int? total,
      final int? totalPage,
      final List<EmployeeModel>? data}) = _$_ListEmployeeModel;

  factory _ListEmployeeModel.fromJson(Map<String, dynamic> json) =
      _$_ListEmployeeModel.fromJson;

  @override
  int? get page;
  @override
  int? get perPage;
  @override
  int? get total;
  @override
  int? get totalPage;
  @override
  List<EmployeeModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ListEmployeeModelCopyWith<_$_ListEmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
