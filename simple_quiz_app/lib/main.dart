import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_quiz_app/provider/app_manager.dart';
import 'package:simple_quiz_app/screens/start_page.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppManager>(
      create: (context) => AppManager(),
      child: MaterialApp(
        home: Builder(
          builder: (context) => const SafeArea(child: StartPage()),
        ),
      ),
    );
  }
}
