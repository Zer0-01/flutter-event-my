import 'package:json_annotation/json_annotation.dart';

part 'catering_list_dto_response.g.dart';

@JsonSerializable()
class CateringListDtoResponse {
  final List<Caterer> caterers;

  CateringListDtoResponse({required this.caterers});

  factory CateringListDtoResponse.fromJson(Map<String, dynamic> json) =>
      _$CateringListDtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CateringListDtoResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Caterer {
  final int id;
  @JsonKey(name: 'company_name')
  final String companyName;
  final String description;
  final List<String> tags;
  final Location location;
  final double rating;
  final List<String> services;

  Caterer({
    required this.id,
    required this.companyName,
    required this.description,
    required this.tags,
    required this.location,
    required this.rating,
    required this.services,
  });

  factory Caterer.fromJson(Map<String, dynamic> json) =>
      _$CatererFromJson(json);

  Map<String, dynamic> toJson() => _$CatererToJson(this);
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
