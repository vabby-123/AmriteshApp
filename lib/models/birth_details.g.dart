// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birth_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthDetails _$BirthDetailsFromJson(Map<String, dynamic> json) => BirthDetails()
  ..dobYear = json['dobYear'] as int?
  ..dobMonth = json['dobMonth'] as int?
  ..dobDay = json['dobDay'] as int?
  ..tobHour = json['tobHour'] as int?
  ..tobMin = json['tobMin'] as int?
  ..meridiem = json['meridiem'] as String?;

Map<String, dynamic> _$BirthDetailsToJson(BirthDetails instance) =>
    <String, dynamic>{
      'dobYear': instance.dobYear,
      'dobMonth': instance.dobMonth,
      'dobDay': instance.dobDay,
      'tobHour': instance.tobHour,
      'tobMin': instance.tobMin,
      'meridiem': instance.meridiem,
    };
