import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_quiz_app/widgets/display_answers.dart';
import 'package:simple_quiz_app/widgets/display_question.dart';
import 'package:simple_quiz_app/widgets/display_right_answer.dart';
import 'package:simple_quiz_app/widgets/display_score.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(height: 50, child: DisplayScore()),
              Expanded(
                child: DisplayQuestion(),
              ),
              DisplayRightAnswer(),
              Expanded(
                child: DisplayAnswers(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
