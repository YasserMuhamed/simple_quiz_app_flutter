import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage(this.SwitchScreen, {super.key});

  void Function() SwitchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Learn Flutter!",
            style: GoogleFonts.abel(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent),
              onPressed: SwitchScreen,
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              label: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
