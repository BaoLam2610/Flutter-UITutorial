import 'package:flutter/material.dart';
import 'package:ui_tutorial/pages/screen_1/home_1.dart';
import 'package:ui_tutorial/pages/screen_2/home_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home2Screen(),
      // const Home1Screen(),
    );
  }
}