class Answer {
  final String text;
  final bool value;

  Answer({
    this.text,
    this.value,
  });

  Answer.fromJson(Map<String, dynamic> parsedJson)
      : text = parsedJson['text'],
        value = parsedJson['value'];
}
