import 'package:flutter/material.dart';
import 'package:quizpany/models/answer.dart';

class Answer extends StatelessWidget {
  final AnswerModel answer;
  final int _value;
  final int _groupValue;
  final Function _onSelect;

  Answer(this.answer, this._value, this._groupValue, this._onSelect);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Radio(
            value: _value,
            groupValue: _groupValue,
            onChanged: _onSelect,
          ),
          Text(answer.text),
        ],
      ),
    );
  }
}
