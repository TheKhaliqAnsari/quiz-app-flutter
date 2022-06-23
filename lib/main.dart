import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answer': ['Red', 'Yellow', 'Blue', 'Black'],
    },
    {
      'questionText': 'Who is your favourite football player?',
      'answer': ['Messie', 'Ronaldo', 'Sachin', 'Nybore'],
    },
    {
      'questionText': 'What is your favourite programming language?',
      'answer': ['C++', 'Javascript', 'Python', 'Java'],
    },
  ];

  var _questionIndex = 0;

  void _answerChoosen() {
    setState(() {
      _questionIndex++;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
        body: _questionIndex < questions.length
            ? Column(
                children: [
                  Questions(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answer'] as List<String>)
                      .map((answer) {
                    return Answer(_answerChoosen, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('You did it'),
              ),
      ),
    );
  }
}
