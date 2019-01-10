import 'package:flutter/material.dart';

class FinalScoreCard extends StatelessWidget {
  final List<bool> answers;
  final VoidCallback onSubmit;
  final scoreThreshold = 0.65;

  FinalScoreCard(this.answers, this.onSubmit);

  double _getScore() {
    final rightCount = answers.fold(
      0,
      (nRight, answer) => nRight + (answer ? 1 : 0),
    );
    return rightCount / answers.length;
  }

  @override
  Widget build(BuildContext context) {
    final score = _getScore();
    final isPassingScore = score > scoreThreshold;

    return Card(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Opacity(
                  opacity: 0.4,
                  child: Icon(
                    isPassingScore ? Icons.check : Icons.close,
                    color:
                        isPassingScore ? Colors.greenAccent : Colors.redAccent,
                    size: 250.0,
                  ),
                ),
                Positioned(
                  top: 250.0 / 8,
                  width: 250.0,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Your score is ${(score * 100).toStringAsFixed(0)}%',
                      ),
                      SizedBox(height: 250.0 / 4),
                      Text(
                        isPassingScore
                            ? 'With this score, you can submit your results!'
                            : ' Sorry, you are not experienced enough for us.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RaisedButton.icon(
              label: Text('Submit'),
              icon: Icon(Icons.send),
              onPressed: isPassingScore ? onSubmit : null,
            ),
          ],
        ),
      ),
    );
  }
}
