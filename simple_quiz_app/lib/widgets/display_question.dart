import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quiz_app/helper/special_characters.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';

class DisplayQuestion extends StatelessWidget {
  const DisplayQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentQuestion =
        context.select((AppManager ap) => ap.currentQuestion)?.question ?? '';
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Text(
          currentQuestion.getNormalString(),
          semanticsLabel: currentQuestion,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
