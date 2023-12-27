import 'package:json_annotation/json_annotation.dart';

part 'birth_place.g.dart';

@JsonSerializable()
class BirthPlace {
  String? placeName;
  String? placeId;

  BirthPlace();

  factory BirthPlace.fromJson(Map<String, dynamic> json) =>
      _$BirthPlaceFromJson(json);

  Map<String, dynamic> toJson() => _$BirthPlaceToJson(this);
}
