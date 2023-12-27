// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionCategory _$QuestionCategoryFromJson(Map<String, dynamic> json) =>
    QuestionCategory()
      ..id = (json['id'] as num?)?.toDouble()
      ..name = json['name'] as String?
      ..description = json['description'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..suggestions = (json['suggestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$QuestionCategoryToJson(QuestionCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'suggestions': instance.suggestions,
    };
