import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quizpany/blocs/correct_answers_bloc.dart';
import 'package:quizpany/blocs/questions_bloc.dart';
import 'package:quizpany/models/answer.dart';
import 'package:quizpany/models/question.dart';
import 'package:quizpany/widgets/final_score_card.dart';

class Results extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  HashSet<int> _expandedAnswers = HashSet.identity();

  BuildContext _scaffoldContext;

  ExpansionPanel _buildAnswerExpansionPanel(
      QuestionModel question, bool isRight) {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            isRight ? Icons.check : Icons.clear,
            color: isRight ? Colors.green : Colors.red,
          ),
          title: Text(
            question.text,
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
      isExpanded: _expandedAnswers.contains(question.id),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          question.explanation,
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
            return StreamBuilder(
              stream: correctAnswersBloc.answers,
              builder: (context, AsyncSnapshot<List<bool>> answersSnapshot) {
                return StreamBuilder(
                  stream: bloc.questions,
                  builder: (context,
                      AsyncSnapshot<List<QuestionModel>> questionsSnapshot) {
                    return ListView(
                      children: <Widget>[
                        ExpansionPanelList(
                          expansionCallback: (index, isExpanded) {
                            setState(() {
                              final questionId =
                                  questionsSnapshot.data[index].id;
                              if (_expandedAnswers.contains(questionId)) {
                                _expandedAnswers.remove(questionId);
                              } else {
                                _expandedAnswers.add(questionId);
                              }
                            });
                          },
                          children: questionsSnapshot.data
                              .map((question) => _buildAnswerExpansionPanel(
                                  question,
                                  answersSnapshot.data[questionsSnapshot.data
                                      .indexOf(question)]))
                              .toList(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: FinalScoreCard(
                            answersSnapshot.data,
                            () {
                              Scaffold.of(_scaffoldContext).showSnackBar(
                                SnackBar(
                                  content: Text('Your data has been sent'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
