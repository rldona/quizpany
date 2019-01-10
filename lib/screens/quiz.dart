import 'package:flutter/material.dart';
import 'package:quizpany/blocs/questions_bloc.dart';
import 'package:quizpany/models/question.dart';

import 'package:quizpany/widgets/timer.dart';
import 'package:quizpany/widgets/quiz_card.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  AnimationController timerController;
  List<int> givenAnswers = [];
  int _currentQuestion = 0;
  int _maxQuestions = 0;

  final _questionTime = Duration(seconds: 10);

  @override
  void initState() {
    super.initState();
    timerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    timerController.forward();
    timerController.addStatusListener((AnimationStatus status) {
      print(status);
      if (status == AnimationStatus.completed) {
        chooseAnswer(-1);
      }
    });
  }

  void chooseAnswer(int answerIndex) {
    setState(() {
      givenAnswers.add(answerIndex);
      if (_currentQuestion != _maxQuestions - 1 ) {
        _currentQuestion += 1;
        timerController.forward(from: 0.0);
      } else {
        Navigator.pushReplacementNamed(context, '/results');
      }
    });
  }

  

  Widget _buildBody(List<QuestionModel> questions) {
    print(questions[_currentQuestion]);
    return Column(
      children: <Widget>[
        TimerBar(timerController, _questionTime),
        SizedBox(height: 10),
        QuizCard(questions[_currentQuestion], chooseAnswer),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
            stream: bloc.questions.take(1),
            builder: (context, AsyncSnapshot<List<QuestionModel>> snapshot) {
              if (snapshot.hasData) {
                _maxQuestions = snapshot.data.length;
                return _buildBody(snapshot.data);
              } else if (snapshot.hasError) {
                return Text('Error $snapshot.error');
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
