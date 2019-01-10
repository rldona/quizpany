import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Map<String, dynamic> answer;
  final _answerGroup;
  final _answerSelected;

  Answer(this.answer, this._answerGroup, this._answerSelected);

  _selected(value) {
    _answerSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Radio(
            value: answer['id'],
            groupValue: _answerGroup,
            onChanged: _selected,
          ),
          Text(answer['title']),
        ],
      ),
    );
  }
}
