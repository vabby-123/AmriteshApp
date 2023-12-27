import 'package:json_annotation/json_annotation.dart';

import 'birth_details.dart';
import 'birth_place.dart';

part 'family_profile.g.dart';

@JsonSerializable()
class FamilyProfile {
  String? uuid;
  String? relation;
  double? relationId;
  String? firstName;
  String? middleName;
  String? lastName;
  String? fullName;
  String? gender;
  String? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  FamilyProfile();

  factory FamilyProfile.fromJson(Map<String, dynamic> json) =>
      _$FamilyProfileFromJson(json);

  Map<String, dynamic> toJson() => _$FamilyProfileToJson(this);
}
