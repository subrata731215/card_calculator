import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.black54)),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
