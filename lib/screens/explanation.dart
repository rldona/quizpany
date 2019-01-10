import 'package:flutter/material.dart';

class Explanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RaisedButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/quiz'),
          child: Text("Start quiz"),
        )
      )
    );
  }

}