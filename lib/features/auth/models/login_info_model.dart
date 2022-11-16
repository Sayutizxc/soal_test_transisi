import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/features/auth/models/login_info_model.freezed.dart';
part '../../../generated/features/auth/models/login_info_model.g.dart';

@freezed
class LoginInfoModel with _$LoginInfoModel {
  factory LoginInfoModel({
    String? token,
    String? error,
  }) = _LoginInfoModel;

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoModelFromJson(json);
}
