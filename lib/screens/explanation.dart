import 'package:flutter/material.dart';

class Explanation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse laoreet eros in odio congue convallis. Nunc rhoncus dolor fermentum accumsan condimentum. Curabitur tristique vulputate magna, dignissim vulputate arcu malesuada eu. Duis lorem quam, pulvinar et ipsum nec, pulvinar varius odio. Aliquam diam nulla, elementum sed ipsum at, faucibus suscipit nisl. Cras id rhoncus urna. Pellentesque gravida sodales ultricies. Suspendisse elit mi, lacinia vitae lacus eget, viverra sollicitudin ligula. Fusce eu odio mollis, maximus lacus in, iaculis libero. Vestibulum scelerisque dui eget elit mattis tempus. Integer ligula tortor, scelerisque et pulvinar at, semper sed quam. Curabitur id nibh id nisl pretium congue eget in diam. Donec tincidunt venenatis elit at interdum. Nulla enim magna, facilisis nec nisl feugiat, efficitur malesuada ipsum. Nunc sed consectetur tortor, in molestie orci. Donec bibendum erat non magna fermentum auctor."),
              RaisedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/quiz'),
                child: Text("Start quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
