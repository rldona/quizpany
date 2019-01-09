import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quizpany/models/answer.dart';
import 'package:quizpany/widgets/final_score_card.dart';

class ResultsScreen extends StatefulWidget {
  final List<Answer> _answers = [
    Answer(
      id: 1,
      rightAnswer: 'A',
      givenAnswer: 'A',
      question: 'Diferencia entre map y reduce',
      explanation: "Map mapea y Reduce reduce",
    ),
    Answer(
      id: 2,
      rightAnswer: 'B',
      givenAnswer: 'B',
      question: 'Question 2',
      explanation: "This is an explanation for the question 2",
    ),
    Answer(
      id: 3,
      rightAnswer: 'C',
      givenAnswer: 'C',
      question: 'Question 3',
      explanation: "This is an explanation for the question 3",
    ),
    Answer(
      id: 4,
      rightAnswer: 'A',
      givenAnswer: 'B',
      question: 'Question 4',
      explanation: "This is an explanation for the question 4",
    ),
    Answer(
      id: 5,
      rightAnswer: 'D',
      givenAnswer: 'D',
      question: 'Question 5',
      explanation: "This is an explanation for the question 5",
    ),
  ];

  @override
  State<StatefulWidget> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  HashSet<int> _expandedAnswers = HashSet.identity();

  BuildContext _scaffoldContext;

  ExpansionPanel _buildAnswerExpansionPanel(Answer answer) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            answer.isRight ? Icons.check : Icons.clear,
            color: answer.isRight ? Colors.green : Colors.red,
          ),
          title: Text(
            answer.question,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
      isExpanded: _expandedAnswers.contains(answer.id),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          answer.explanation,
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
                        final answerId = widget._answers[index].id;
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
