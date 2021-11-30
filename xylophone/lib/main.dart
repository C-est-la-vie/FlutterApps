import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/widgets/note.dart';

void main() {
  runApp(MyXylophoneApp());
}

class MyXylophoneApp extends StatelessWidget {
  MyXylophoneApp({Key? key}) : super(key: key);
  final AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Note(
                color: Colors.red,
                makeSound: () => player.play('note1.wav'),
              ),
              Note(
                color: Colors.orange,
                makeSound: () => player.play('note2.wav'),
              ),
              Note(
                color: Colors.yellow,
                makeSound: () => player.play('note3.wav'),
              ),
              Note(
                color: Colors.green,
                makeSound: () => player.play('note4.wav'),
              ),
              Note(
                color: Colors.lightBlue.shade200,
                makeSound: () => player.play('note5.wav'),
              ), Note(
                color: Colors.blue,
                makeSound: () => player.play('note6.wav'),
              ),
              Note(
                color: Colors.deepPurple,
                makeSound: () => player.play('note7.wav'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

