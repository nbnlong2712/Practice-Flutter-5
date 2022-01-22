import 'package:flutter/material.dart';
import 'package:flutter_review/src/screen/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login here!",
      home: Scaffold(
        body: SafeArea(
          child: LoginScreen(),
        ),
      ),
    );
  }
}
