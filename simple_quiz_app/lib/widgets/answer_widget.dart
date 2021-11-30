import 'package:flutter/material.dart';
import 'package:simple_quiz_app/helper/special_characters.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({Key? key, required this.onSelect, required this.answer})
      : super(key: key);
  final VoidCallback? onSelect;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      child: TextButton(
        style:
            TextButton.styleFrom(backgroundColor: Colors.yellowAccent.shade200),
        onPressed: onSelect,
        child: Text(
          answer.getNormalString(),
          semanticsLabel: answer,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontFamily: 'Coiny'),
        ),
      ),
    );
  }
}
