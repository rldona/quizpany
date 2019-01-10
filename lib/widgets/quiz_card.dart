import 'package:flutter/material.dart';
import 'package:quizpany/models/question.dart';

import 'package:quizpany/widgets/answer.dart';

class QuizCard extends StatefulWidget {
  final QuestionModel question;
  final Function _onAnswer;

  QuizCard(this.question, this._onAnswer);

  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  int _selectedAnswer;

  _renderAnswers() => widget.question.answers.map<Widget>((answer) => Answer(answer, widget.question.answers.indexOf(answer), _selectedAnswer, _onSelect,)).toList();

  _onSelect(int selectedAnswer) {
    setState(() {
      _selectedAnswer = selectedAnswer;
      widget._onAnswer(selectedAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
       child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text(widget.question.text, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Wrap(children: _renderAnswers()),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

// class QuizCard extends StatelessWidget {
//   final Map<String, dynamic> quiz;

//   QuizCard(this.quiz);

//   _renderAnswers() => quiz['answers'].map<Widget>((answer) => Answer(answer, _answerSelected)).toList();

//   _answerSelected(id) {
//     print(id);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(10),
//        child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               title: Text(quiz['question'], style: TextStyle(fontWeight: FontWeight.bold),),
//             ),
//             Wrap(children: _renderAnswers()),
//             SizedBox(height: 10)
//           ],
//         ),
//       ),
//     );
//   }
// }
