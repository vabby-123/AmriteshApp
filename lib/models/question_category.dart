import 'package:json_annotation/json_annotation.dart';

part 'question_category.g.dart';

@JsonSerializable()
class QuestionCategory {
  double? id;
  String? name;
  String? description;
  double? price;
  List<String>? suggestions;

  QuestionCategory();

  factory QuestionCategory.fromJson(Map<String, dynamic> json) =>
      _$QuestionCategoryFromJson(json);
}
