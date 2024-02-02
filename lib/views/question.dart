// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/models/quiz_question.dart';

import 'package:quiz/widgets/custom_elevated.dart';

class QuistionPage extends StatefulWidget {
  QuistionPage(this.SavedAnswerFunc, {super.key});

  // ignore: non_constant_identifier_names
  final void Function(String) SavedAnswerFunc;

  @override
  State<QuistionPage> createState() => _QuistionPageState();
}

class _QuistionPageState extends State<QuistionPage> {
  int CurrentQuestionIndex = 0;

  // pass The Value that user pressed on to the function => (SavedAnswer) in => QuizPage() &&
  // increase current index by 1 to get ot the next Question.
  void AnswerQuestion(String value) {
    widget.SavedAnswerFunc(value);
    setState(() {
      CurrentQuestionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    QuizQuestion CurrentQ = QuestionsList[CurrentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            CurrentQ.question,
            style: GoogleFonts.abel(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          ...CurrentQ.getSuffledAnswers().map(
            (e) => Container(
              margin: const EdgeInsets.all(10),
              child: CustomButton(
                  onTapAction: () {
                    AnswerQuestion(e);
                  },
                  Answer: e),
            ),
          )
        ],
      ),
    );
  }
}
