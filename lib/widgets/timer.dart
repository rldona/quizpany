import 'dart:math';
import 'package:flutter/material.dart';

class _TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _TimerPainter({
    this.animation,
    this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTRB(0, 0, size.width * animation.value, size.height), paint);
    // canvas.drawArc(Offset.zero & size, 3 * pi / 2, -progress, true, paint);
  }

  @override
  bool shouldRepaint(_TimerPainter old) {
    return animation.value != old.animation.value || color != old.color;
  }
}

class TimerBar extends StatelessWidget {
  final Animation<double> animation;
  final Duration questionTime;

  TimerBar(this.animation, this.questionTime);

  String get timerString {
    Duration timeLeft = questionTime - (questionTime * animation.value);
    //_questionTime - (animation.duration * animation.value);
    return '${(timeLeft.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                Color color = Color.lerp(
                  Colors.blue,
                  Colors.red,
                  animation.value,
                );

                return CustomPaint(
                  painter: _TimerPainter(
                    animation: animation,
                    color: color,
                  ),
                );
              },
            ),
          ),
          Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return new Text(
                  timerString,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
