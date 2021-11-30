import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';

class DisplayScore extends StatelessWidget {
  const DisplayScore({Key? key}) : super(key: key);

  final rightAnswerIcon = const Icon(
    Icons.check_sharp,
    color: Colors.green,
  );

  final wrongAnswerIcon = const Icon(
    Icons.close,
    color: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    final listOfIcons = context.select((AppManager am) => am.scoresLength);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listOfIcons,
      itemBuilder: (context, index) {
        final value = context.read<AppManager>().scores[index];
        return value ? rightAnswerIcon : wrongAnswerIcon;
      },
    );
  }
}
