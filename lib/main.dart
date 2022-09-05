import 'package:flutter/material.dart';
import 'package:paprclip/Brain.dart';
import 'package:paprclip/Screens/screen1.dart';
import 'package:paprclip/Screens/loadingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Loading(),
    );
  }
}


