import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<Map<String, dynamic>> _answers = [
    {
      'id': 1,
      'rightAnswer': 'A',
      'givenAnswer': 'B',
      'question': 'Diferencia entre map y reduce',
      'explanation': "Map mapea y Reduce reduce",
      'expanded': false,
    },
    {
      'id': 2,
      'rightAnswer': 'B',
      'givenAnswer': 'B',
      'question': 'Question 2',
      'explanation': "This is an explanation for the question 2",
      'expanded': false,
    },
    {
      'id': 3,
      'rightAnswer': 'C',
      'givenAnswer': 'C',
      'question': 'Question 3',
      'explanation': "This is an explanation for the question 3",
      'expanded': false,
    },
    {
      'id': 4,
      'rightAnswer': 'A',
      'givenAnswer': 'B',
      'question': 'Question 4',
      'explanation': "This is an explanation for the question 4",
      'expanded': false,
    },
    {
      'id': 5,
      'rightAnswer': 'D',
      'givenAnswer': 'D',
      'question': 'Question 5',
      'explanation': "This is an explanation for the question 5",
      'expanded': false,
    },
  ];

  BuildContext _scaffoldContext;

  ExpansionPanel _buildAnswerExpansionPanel(Map<String, dynamic> answer) {
    final isRight = answer['rightAnswer'] == answer['givenAnswer'];

    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return ListTile(
          leading: Icon(
            isRight ? Icons.clear : Icons.check,
            color: isRight ? Colors.green : Colors.red,
          ),
          title: Text(
            answer['question'],
            style: TextStyle(fontSize: 20.0),
          ),
        );
      },
      isExpanded: answer['expanded'],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Text(
          answer['explanation'],
        ),
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context) {
    final scoreThreshold = 0.65;
    final score = _answers.fold(
            0,
            (nRight, answer) =>
                nRight +
                (answer['rightAnswer'] == answer['givenAnswer'] ? 1 : 0)) /
        _answers.length;
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
                        'Your score is ${score * 100}%',
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
              onPressed: isPassingScore
                ? () {
                    Scaffold.of(_scaffoldContext).showSnackBar(
                      SnackBar(
                        content: Text('Your data has been sent'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Builder(builder: (BuildContext context) {
        _scaffoldContext = context;
        return ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (index, isExpanded) {
                setState(() {
                  _answers[index]['expanded'] = !isExpanded;
                });
              },
              children: _answers.map(_buildAnswerExpansionPanel).toList(),
            ),
            _buildScoreCard(context),
          ],
        );
      }),
    );
  }
}
