// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';

// ignore: must_be_immutable
class AnswersPage extends StatelessWidget {
  AnswersPage({super.key, required this.answers, required this.RESTART});

  final List<String> answers;

  List<Map<String, Object>> summaryMap = [];

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < answers.length; i++) {
      summary.add({
        'question_index': i + 1,
        'question': QuestionsList[i].question,
        'correct_answer': QuestionsList[i].answers[0],
        'Users_answer': answers[i]
      });
    }
    return summary;
  }

  final void Function() RESTART;

  @override
  Widget build(BuildContext context) {
    final summarydata = getSummaryData();
    int numOfCorrectAnswers = summarydata
        .where(
            (element) => element['correct_answer'] == element['Users_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: ListView(
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              'You Answered $numOfCorrectAnswers Out of ${QuestionsList.length} Questions Correctly',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ...getSummaryData().map(
            (e) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: e['correct_answer'].toString() ==
                              e['Users_answer'].toString()
                          ? Colors.blue
                          : Colors.red,
                      radius: 16,
                      child: Text(e['question_index'].toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['question'].toString(),
                            style: GoogleFonts.abel(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(e['correct_answer'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(111, 255, 255, 255),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                          Text(e['Users_answer'].toString(),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
              onPressed: RESTART,
              icon: const Icon(
                Icons.restart_alt_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'RESET',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
