import 'package:quizpany/models/answer.dart';

class QuestionModel {
  final int id;
  final String text;
  final List<Answer> answers;
  final String explanation;
  String category;

  QuestionModel({
    this.id,
    this.text,
    this.answers,
    this.explanation,
  });

  QuestionModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        text = parsedJson['text'],
        answers = List<dynamic>.from(parsedJson['answers'])
            .map((json) => Answer.fromJson(json)).toList(),
        explanation = parsedJson['explanation'];
}
