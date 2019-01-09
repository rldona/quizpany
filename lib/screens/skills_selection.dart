import 'package:flutter/material.dart';

import 'package:quizpany/widgets/category_list.dart';

class SkillsSelection extends StatefulWidget {
  _SkillsSelectionState createState() => _SkillsSelectionState();
}

class _SkillsSelectionState extends State<SkillsSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/images/avatar.png'),
                  fit: BoxFit.fitWidth,
                  width: 100,
                ),
                SizedBox(height: 15),
                Text(
                  'Pepe López López',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'A continuación, según a la posición que te presentas, debes seleccionar las categorías de las cuales quieres que te aparezcan preguntas:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                CategoryList(),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: Text(
                      'Comenzar test'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    color: Colors.blue,
                    onPressed: () => Navigator.pushReplacementNamed(context, '/results'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
