import 'package:flutter/material.dart';
import 'package:quizpany/screens/results.dart';
import 'package:quizpany/screens/Login.dart';
import 'package:quizpany/screens/skills_selection.dart';

void main() => runApp(Quizpany());

class Quizpany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizpany',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Login(),
        '/skillsSelection': (BuildContext context) => SkillsSelection(),
        '/results': (BuildContext context) => ResultsScreen(),
      },
    );
  }
}
