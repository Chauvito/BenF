import 'package:ben_f/screens/First%20time%20connection/Info_page.dart';
import 'package:ben_f/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const InfoPage(), // This is your page
    );
  }
}