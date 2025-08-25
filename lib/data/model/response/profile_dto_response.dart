import 'package:json_annotation/json_annotation.dart';

part 'profile_dto_response.g.dart';

@JsonSerializable()
class ProfileDtoResponse {
  final ProfileData data;

  ProfileDtoResponse({required this.data});

  factory ProfileDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDtoResponseToJson(this);
}

@JsonSerializable()
class ProfileData {
  final String name;
  final String email;

  ProfileData({required this.name, required this.email});

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}
