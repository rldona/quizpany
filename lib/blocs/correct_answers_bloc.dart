import 'package:rxdart/rxdart.dart';

class CorrectAnswersBloc {
  final _controller = BehaviorSubject<List<bool>>();

  Function(List<bool>) get submitAnswers => _controller.sink.add;

  Stream<List<bool>> get answers => _controller.stream;
  

  dispose() {
    _controller.close();
  }
}

final correctAnswersBloc = CorrectAnswersBloc();
