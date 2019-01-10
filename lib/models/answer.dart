class AnswerModel {
  final String text;
  final bool value;

  AnswerModel({
    this.text,
    this.value,
  });

  AnswerModel.fromJson(Map<String, dynamic> parsedJson)
      : text = parsedJson['text'],
        value = parsedJson['value'];

  @override
    String toString() {
      
      return "Answer $text $value";
    }
}
