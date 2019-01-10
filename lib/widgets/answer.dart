import 'package:flutter/material.dart';
import 'package:quizpany/models/answer.dart';

class Answer extends StatelessWidget {
  final AnswerModel answer;
  final int _value;
  final int _groupValue;
  final bool _chosenCorrectAnswer;
  final Function _onSelect;

  Answer(this.answer, this._value, this._groupValue, this._chosenCorrectAnswer,
      this._onSelect);

  @override
  Widget build(BuildContext context) {
    Color backgrounColor;
    TextStyle style;

    if (_value != _groupValue) {
      backgrounColor = Colors.white;
    } else {
      if (_chosenCorrectAnswer) {
        backgrounColor = Colors.green;
      } else {
        backgrounColor = Colors.red;
      }
      style = TextStyle(color: backgrounColor, fontWeight: FontWeight.bold);
    }

    return Container(
      child: Row(
        children: <Widget>[
          Radio(
            value: _value,
            groupValue: _groupValue,
            onChanged: _onSelect,
          ),
          Expanded(
            child: Text(
              answer.text,
              style: style,
            ),
          ),
        ],
      ),
    );
  }
}
