import 'package:flutter/material.dart';
import 'package:quizpany/widgets/timer.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TimerBar(timerController, _questionTime),
          ],
        ),
      ),
    );
  }
}
