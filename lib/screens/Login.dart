import 'package:flutter/material.dart';

import 'package:quizpany/screens/SkillsSelection.dart';


class Login extends StatefulWidget {
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Quizpany', style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          Padding(padding: EdgeInsets.all(95), child:
          RaisedButton(
            color: Color.fromRGBO(255, 85, 14, 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 0), child: Icon(Icons.person, color: Colors.white)),
                Text('Acceder con Google', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
              ]
            ),
            padding: EdgeInsets.all(10),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SkillsSelection()))
          ))
        ],
      ),
    );
  }
}
