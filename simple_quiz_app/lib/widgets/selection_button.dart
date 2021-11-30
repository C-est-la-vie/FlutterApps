import 'package:flutter/material.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';
import 'package:simple_quiz_app/screens/questions_page.dart';
import 'package:provider/provider.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton(
      {Key? key, required this.buttonText, required this.category})
      : super(key: key);
  final String buttonText;
  final QuizCategories category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: TextButton(
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontFamily: 'Coiny',
              ),
        ),
        onPressed: () {
          context.read<AppManager>().loadQuestions(category);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const QuestionsPage(),
            ),
          );
        },
      ),
    );
  }
}
