// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catering_list_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CateringListDtoResponse _$CateringListDtoResponseFromJson(
  Map<String, dynamic> json,
) => CateringListDtoResponse(
  caterers:
      (json['caterers'] as List<dynamic>)
          .map((e) => Caterer.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CateringListDtoResponseToJson(
  CateringListDtoResponse instance,
) => <String, dynamic>{'caterers': instance.caterers};

Caterer _$CatererFromJson(Map<String, dynamic> json) => Caterer(
  id: (json['id'] as num).toInt(),
  companyName: json['company_name'] as String,
  description: json['description'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  rating: (json['rating'] as num).toDouble(),
  services:
      (json['services'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$CatererToJson(Caterer instance) => <String, dynamic>{
  'id': instance.id,
  'company_name': instance.companyName,
  'description': instance.description,
  'tags': instance.tags,
  'location': instance.location.toJson(),
  'rating': instance.rating,
  'services': instance.services,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'address': instance.address,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
