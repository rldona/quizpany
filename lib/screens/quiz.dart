import 'package:flutter/material.dart';

import 'package:quizpany/widgets/timer.dart';
import 'package:quizpany/widgets/quiz_card.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> with TickerProviderStateMixin {
  AnimationController timerController;

  final _questionTime = Duration(seconds: 10);

  @override
  void initState() {
    super.initState();
    timerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    timerController.forward(from: 0.0);
    timerController.addListener(() {
      if (timerController.value == 1.0) {
        //TODO go to next
        timerController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TimerBar(timerController, _questionTime),
            SizedBox(height: 10),
            QuizCard({
              'id': 0,
              'question': '¿ Qué diferencia hay entre == y === ?',
              'answers': [
                { 'id': 0, 'title': '== y === compara que el valor y el tipo de dos objetos son iguales' },
                { 'id': 1, 'title': '== compara el valor de dos objetos y === compara el valor y su tipo' },
                { 'id': 2, 'title': 'Ninguna de la anteriores' },
              ]
            }),
          ],
        ),
      ),
    );
  }
}
