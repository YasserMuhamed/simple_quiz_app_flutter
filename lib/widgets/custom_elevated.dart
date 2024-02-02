import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.Answer, required this.onTapAction});

  final String Answer;
  final void Function() onTapAction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapAction,
      child: Text(Answer, textAlign: TextAlign.center),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
