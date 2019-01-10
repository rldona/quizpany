import 'package:quizpany/models/question.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

class QuestionProvider {
  final assetPath = 'assets/data/questions.json';

  Future<List<Map<String, dynamic>>> _loadFromAssetJson() async {
    return rootBundle.loadString(assetPath).then(
        (jsonStr) => List<Map<String, dynamic>>.from(jsonDecode(jsonStr)));
  }

  Future<List<QuestionModel>> loadQuestions(List<String> categories) async {
    final parsedJson = await _loadFromAssetJson();

    return List<QuestionModel>.from(parsedJson
        .where((element) => categories.contains(element["category"]))
        .map((Map<String, dynamic> json) {
      return json["questions"].map((questionJson) =>
          QuestionModel.fromJson(questionJson)..category = json["category"]);
    }).expand((i) => i));
  }
}
