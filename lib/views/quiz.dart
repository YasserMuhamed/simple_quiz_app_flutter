import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/views/answers_page.dart';
import 'package:quiz/views/home.dart';
import 'package:quiz/views/question.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ignore: non_constant_identifier_names
  List<String> ChoosenAnswer = [];

  // Passed to QuestionsPage() to Add The Value Pressed on to The List &&
  // Check When The Questions Ends to Go to AnswersPage() with Passing RestartFunc with it.
  void SavedAnswer(String answer) {
    ChoosenAnswer.add(answer);

    if (ChoosenAnswer.length == QuestionsList.length) {
      setState(
        () {
          activeScreen = AnswersPage(
            answers: ChoosenAnswer,
            RESTART: RestartFun,
          );
        },
      );
    }
  }

  // Returns us to The HomePage() After Pressing Restart && Empty The List of Users Answers
  void RestartFun() {
    setState(() {
      activeScreen = HomePage(switchScreen);
      ChoosenAnswer = [];
    });
  }

  Widget? activeScreen;

  // Initialize the Value of activeScreen to HomePage().
  @override
  void initState() {
    super.initState();
    activeScreen = HomePage(switchScreen);
  }

  // Change the Value of activeScreen to QuestionsPage().
  void switchScreen() {
    setState(() {
      activeScreen = QuistionPage(SavedAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 77, 43, 136),
              Colors.deepPurple,
              Colors.deepPurpleAccent
            ],
          ),
        ),
        child: activeScreen,
      ),
    );
  }
}
