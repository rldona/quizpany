import 'package:rxdart/rxdart.dart';

import 'package:quizpany/models/question.dart';
import 'package:quizpany/resources/repository.dart';

class QuestionsBloc {
  final _repository = Repository();
  final _questionsFetcher = PublishSubject<List<QuestionModel>>();

  Observable<List<QuestionModel>> get questions => _questionsFetcher.stream;

  fetchQuestions(List<String> categories) async {
    List<QuestionModel> questions =
        await _repository.fetchQuestions(categories);
        _questionsFetcher.sink.add(questions);
  }

  dispose() {
    _questionsFetcher.close();
  }
}


final bloc = QuestionsBloc();