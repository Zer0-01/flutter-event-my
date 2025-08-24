import 'package:json_annotation/json_annotation.dart';

part 'login_dto_response.g.dart';

@JsonSerializable()
class LoginDtoResponse {
  final LoginData data;

  LoginDtoResponse({required this.data});

  factory LoginDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoResponseToJson(this);
}

@JsonSerializable()
class LoginData {
  final LoginUser user;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  LoginData({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()
class LoginUser {
  final String id;

  LoginUser({required this.id});

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
