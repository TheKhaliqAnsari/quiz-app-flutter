import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  List<Map<String, Object>> questions;
  int questionIndex;
  Function answerChoosen;

  Quiz(
      {@required this.questions,
      @required this.answerChoosen,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerChoosen(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
