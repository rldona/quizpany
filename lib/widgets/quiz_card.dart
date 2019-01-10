import 'package:flutter/material.dart';
import 'package:quizpany/models/question.dart';

import 'package:quizpany/widgets/answer.dart';

class QuizCard extends StatefulWidget {
  final QuestionModel _question;
  // final List<Answer> _shuffledAnswers
  final Function _onAnswer;

  QuizCard(this._question, this._onAnswer) {
    _question.answers.shuffle();
  }

  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  int _selectedAnswer;
  bool _chosenCorrectAnswer;
  QuestionModel _question;

  _renderAnswers() => widget._question.answers
      .map<Widget>(
        (answer) => Answer(
              answer,
              widget._question.answers.indexOf(answer),
              _selectedAnswer,
              _chosenCorrectAnswer,
              _onSelect,
            ),
      )
      .toList();

  _onSelect(int selectedAnswer) {
    setState(() {
      _chosenCorrectAnswer = _question.answers[selectedAnswer].value;
      _selectedAnswer = selectedAnswer;
    });
    widget._onAnswer(_chosenCorrectAnswer);
  }

  @override
  Widget build(BuildContext context) {
    if (_question != widget._question) {
      setState(() {
        _question = widget._question;
        _selectedAnswer = null;
      });
    }
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(
                widget._question.text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Wrap(children: _renderAnswers()),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}