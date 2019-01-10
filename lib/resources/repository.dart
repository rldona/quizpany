import 'dart:async';

import 'package:quizpany/models/question.dart';
import 'package:quizpany/resources/question_provider.dart';

class Repository {
  final questionsProvider = QuestionProvider();

  Future<List<QuestionModel>> fetchQuestions(List<String> categories) =>
      questionsProvider.loadQuestions(categories);
}
