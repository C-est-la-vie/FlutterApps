import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';
import 'package:simple_quiz_app/screens/start_page.dart';

class EndPage extends StatelessWidget {
  const EndPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final correctAnswers = context.select((AppManager am) => am.rightAnswers);
    final incorrectAnswers = context.select((AppManager am) => am.wrongAnswers);
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You got $correctAnswers right \n and $incorrectAnswers wrong',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () {
                  context.read<AppManager>().clearGame();

                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StartPage(),
                  ));
                },
                child: Text(
                  'TRY AGAIN',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
