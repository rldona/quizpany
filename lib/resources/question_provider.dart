import 'package:quizpany/models/question.dart';

import 'dart:convert';

import 'package:flutter/services.dart';

class QuestionProvider {
  final assetPath = 'assets/data/questions.json';

  Future<List<Map<String, dynamic>>> _loadFromAssetJson() async {
    return rootBundle
        .loadString(assetPath)
        .then((jsonStr) => List.from(jsonDecode(jsonStr)));
  }

  Future<List<QuestionModel>> loadQuestions(List<String> categories) async {
    final parsedJson = await _loadFromAssetJson();

    print(parsedJson.where((element) => categories.contains(element["category"])));

    return <QuestionModel>[];

    return parsedJson
        .where((element) => categories.contains(element["category"]))
        .map((json) => QuestionModel.fromJson(json["questions"])
          ..category = json["category"])
        .toList();
  }
}
