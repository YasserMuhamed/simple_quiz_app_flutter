import 'package:flutter/material.dart';
import 'package:quiz/views/quiz.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}
