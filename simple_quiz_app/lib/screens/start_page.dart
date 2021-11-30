import 'package:flutter/material.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';
import 'package:simple_quiz_app/widgets/selection_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'START',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontFamily: 'Coiny',
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            const SelectionButton(
              buttonText: 'Entertainment',
              category: QuizCategories.entertainment,
            ),
            const SelectionButton(
              buttonText: 'History',
              category: QuizCategories.history,
            ),
            const SelectionButton(
              buttonText: 'Mythology',
              category: QuizCategories.mythology,
            ),
          ],
        ),
      ),
    );
  }
}
