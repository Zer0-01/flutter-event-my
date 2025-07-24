import 'package:json_annotation/json_annotation.dart';

part 'venue_list_dto_response.g.dart';

@JsonSerializable()
class VenueListDtoResponse {
  final List<Venue> venues;

  VenueListDtoResponse({required this.venues});

  factory VenueListDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$VenueListDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VenueListDtoResponseToJson(this);
}

@JsonSerializable()
class Venue {
  final int id;
  @JsonKey(name: 'place_name')
  final String placeName;
  final String description;
  final List<String> tags;
  final Location location;
  final double rating;
  final List<String> offered;

  Venue({
    required this.id,
    required this.placeName,
    required this.description,
    required this.tags,
    required this.location,
    required this.rating,
    required this.offered,
  });

  factory Venue.fromJson(Map<String, dynamic> json) => _$VenueFromJson(json);

  Map<String, dynamic> toJson() => _$VenueToJson(this);
}

@JsonSerializable()
class Location {
  final String address;
  final double latitude;
  final double longitude;

  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
