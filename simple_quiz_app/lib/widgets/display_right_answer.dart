import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simple_quiz_app/helper/special_characters.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';

class DisplayRightAnswer extends StatelessWidget {
  const DisplayRightAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answer =
        context.select((AppManager am) => am.currentQuestion)?.correctAnswer ??
            '';
    final isAnswerVisible =
        context.select((AppManager am) => am.isAnswerVisible);
    return Visibility(
      visible: isAnswerVisible,
      maintainSize: true,
      maintainState: true,
      maintainAnimation: true,
      child: Text(
        answer.getNormalString().toUpperCase(),
        semanticsLabel: answer,
        style: const TextStyle(
            color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
