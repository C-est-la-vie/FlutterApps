import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';
import 'package:simple_quiz_app/screens/end_page.dart';
import 'package:simple_quiz_app/widgets/answer_widget.dart';

class DisplayAnswers extends StatelessWidget {
  const DisplayAnswers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = context.select((AppManager am) => am.currentIndex);
    final answers = context.select((AppManager am) => am.getAnswers(index));
    return ListView.builder(
      itemCount: answers.length,
      itemBuilder: (context, index) {
        return AnswerWidget(
          onSelect: () {
            /// Show Right Answer
            context.read<AppManager>()
              ..isAnswerVisible = true

              /// Check Answer
              ..checkAnswer(answer: answers[index]);

            Future.delayed(const Duration(seconds: 1), () {
              context.read<AppManager>()
                ..isAnswerVisible = false

                /// Update Current Index
                ..updateCurrentIndex();

              ///Check if it's last question
              final isLastQuestion =
                  context.read<AppManager>().isLastQuestion();
              if (isLastQuestion) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const EndPage(),
                  ),
                );
              }
            });
          },
          answer: answers[index],
        );
      },
    );
  }
}
