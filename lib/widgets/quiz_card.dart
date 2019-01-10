import 'package:flutter/material.dart';

import 'package:quizpany/widgets/answer.dart';

class QuizCard extends StatefulWidget {
  final Map<String, dynamic> quiz;

  QuizCard(this.quiz);

  _QuizCardState createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  int _answerGroup;

  @override
  void initState(){
    super.initState();

    setState(() {
      _answerGroup = 0;
    });
  }

  _renderAnswers() => widget.quiz['answers'].map<Widget>((answer) => Answer(answer, _answerGroup, _answerSelected)).toList();

  _answerSelected(id) {
    setState(() {
      _answerGroup = id;
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
              title: Text(widget.quiz['question'], style: TextStyle(fontWeight: FontWeight.bold),),
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
