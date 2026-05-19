import 'package:adil_portfolio/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adil\'s Portfolio',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.black45),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}