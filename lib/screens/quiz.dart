import 'package:flutter/material.dart';
import 'package:quizpany/blocs/questions_bloc.dart';
import 'package:quizpany/models/answer.dart';
import 'package:quizpany/models/question.dart';
import 'package:quizpany/widgets/timer.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  AnimationController timerController;
  List<int> givenAnswers = [];
  int currentQuestion = 0;

  final _questionTime = Duration(seconds: 10);

  void chooseAnswer(int answerIndex) {
    print("Choosing $answerIndex for ");
    setState(() {
      givenAnswers.add(answerIndex);
      currentQuestion += 1;
      timerController.forward(from: 0.0);
    });
  }

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

  Widget _buildBody(List<QuestionModel> questions) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TimerBar(timerController, _questionTime),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: StreamBuilder(
            stream: bloc.questions.take(1),
            builder: (context, AsyncSnapshot<List<QuestionModel>> snapshot) {
              if (snapshot.hasData) {
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
