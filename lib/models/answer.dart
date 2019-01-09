class Answer {
  final int id;
  final String rightAnswer;
  final String givenAnswer;
  final String question;
  final String explanation;

  Answer(
      {this.id,
      this.rightAnswer,
      this.givenAnswer,
      this.question,
      this.explanation});

  bool get isRight => rightAnswer == givenAnswer;
}
