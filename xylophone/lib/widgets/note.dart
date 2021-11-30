import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({Key? key, required this.color, required this.makeSound})
      : super(key: key);
  final Color color;
  final VoidCallback makeSound;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Container(
          color: color,
        ),
        onPressed: () => makeSound(),
      ),
    );
  }
}
