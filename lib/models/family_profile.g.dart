// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyProfile _$FamilyProfileFromJson(Map<String, dynamic> json) =>
    FamilyProfile()
      ..uuid = json['uuid'] as String?
      ..relation = json['relation'] as String?
      ..relationId = (json['relationId'] as num?)?.toDouble()
      ..firstName = json['firstName'] as String?
      ..middleName = json['middleName'] as String?
      ..lastName = json['lastName'] as String?
      ..fullName = json['fullName'] as String?
      ..gender = json['gender'] as String?
      ..dateAndTimeOfBirth = json['dateAndTimeOfBirth'] as String?
      ..birthDetails = json['birthDetails'] == null
          ? null
          : BirthDetails.fromJson(json['birthDetails'] as Map<String, dynamic>)
      ..birthPlace = json['birthPlace'] == null
          ? null
          : BirthPlace.fromJson(json['birthPlace'] as Map<String, dynamic>);

Map<String, dynamic> _$FamilyProfileToJson(FamilyProfile instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'relation': instance.relation,
      'relationId': instance.relationId,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'dateAndTimeOfBirth': instance.dateAndTimeOfBirth,
      'birthDetails': instance.birthDetails,
      'birthPlace': instance.birthPlace,
    };
