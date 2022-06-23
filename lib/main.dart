import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 6},
        {'text': 'Purple', 'score': 3},
        {'text': 'White', 'score': 0},
      ],
    },
    {
      'questionText': 'Who is your favourite football player?',
       'answer': [
        {'text': 'Messi', 'score': 10},
        {'text': 'Ronaldo', 'score': 6},
        {'text': 'Scahin', 'score': 3},
        {'text': 'Nybore', 'score': 0},
      ],
      //'answer': ['Messie', 'Ronaldo', 'Sachin', 'Nybore'],
    },
    {
      'questionText': 'What is your favourite programming language?',
      'answer': [
        {'text': 'C++', 'score': 10},
        {'text': 'Python', 'score': 6},
        {'text': 'Java', 'score': 3},
        {'text': 'Javascript', 'score': 0},
      ],
      //'answer': ['C++', 'Javascript', 'Python', 'Java'],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerChoosen(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("we have more Questions!!");
    } else {
      print("We don't have more questions for you!");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerChoosen: _answerChoosen,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore),
      ),
    );
  }
}
