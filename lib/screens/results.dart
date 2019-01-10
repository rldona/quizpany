import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quizpany/models/answer.dart';
import 'package:quizpany/widgets/final_score_card.dart';

class Results extends StatefulWidget {
  final List<AnswerModel> _answers = [
  ];

  @override
  State<StatefulWidget> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  HashSet<int> _expandedAnswers = HashSet.identity();

  BuildContext _scaffoldContext;

  ExpansionPanel _buildAnswerExpansionPanel(AnswerModel answer) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            answer.value ? Icons.check : Icons.clear,
            color: answer.value ? Colors.green : Colors.red,
          ),
          title: Text(
            answer.text,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
      isExpanded: _expandedAnswers.contains(answer.hashCode),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          answer.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            _scaffoldContext = context;
            return ListView(
              children: <Widget>[
                ExpansionPanelList(
                    expansionCallback: (index, isExpanded) {
                      setState(() {
                        final answerId = widget._answers[index].hashCode;
                        if (_expandedAnswers.contains(answerId)) {
                          _expandedAnswers.remove(answerId);
                        } else {
                          _expandedAnswers.add(answerId);
                        }
                      });
                    },
                    children: widget._answers
                        .map(_buildAnswerExpansionPanel)
                        .toList()),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: FinalScoreCard(widget._answers, () {
                    Scaffold.of(_scaffoldContext).showSnackBar(
                      SnackBar(
                        content: Text('Your data has been sent'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
