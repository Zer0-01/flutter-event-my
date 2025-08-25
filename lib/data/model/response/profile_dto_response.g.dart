// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDtoResponse _$ProfileDtoResponseFromJson(Map<String, dynamic> json) =>
    ProfileDtoResponse(
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileDtoResponseToJson(ProfileDtoResponse instance) =>
    <String, dynamic>{'data': instance.data};

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) =>
    ProfileData(name: json['name'] as String, email: json['email'] as String);

Map<String, dynamic> _$ProfileDataToJson(ProfileData instance) =>
    <String, dynamic>{'name': instance.name, 'email': instance.email};
