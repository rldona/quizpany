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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-login.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Quizpany',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'RobotoMono'
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(90),
                child: RaisedButton(
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0)),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Image(image: AssetImage('assets/images/google.jpg'), fit: BoxFit.fitWidth, width: 25),
                      ),
                      Text(
                        'Acceder con Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SkillsSelection(),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
