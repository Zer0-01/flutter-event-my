// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venue_list_dto_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VenueListDtoResponse _$VenueListDtoResponseFromJson(
  Map<String, dynamic> json,
) => VenueListDtoResponse(
  venues:
      (json['venues'] as List<dynamic>)
          .map((e) => Venue.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$VenueListDtoResponseToJson(
  VenueListDtoResponse instance,
) => <String, dynamic>{'venues': instance.venues};

Venue _$VenueFromJson(Map<String, dynamic> json) => Venue(
  id: (json['id'] as num).toInt(),
  placeName: json['place_name'] as String,
  description: json['description'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  rating: (json['rating'] as num).toDouble(),
  offered: (json['offered'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$VenueToJson(Venue instance) => <String, dynamic>{
  'id': instance.id,
  'place_name': instance.placeName,
  'description': instance.description,
  'tags': instance.tags,
  'location': instance.location,
  'rating': instance.rating,
  'offered': instance.offered,
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
