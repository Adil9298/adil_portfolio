import 'package:adil_portfolio/features/home/screens/home_screen.dart';
import 'package:adil_portfolio/features/splash/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //       apiKey: "AIzaSyBziBgIh7W-KA2vT4hEnIs-qNTBKtDOvbk",
  //       authDomain: "keygallery-34dd1.firebaseapp.com",
  //       projectId: "keygallery-34dd1",
  //       storageBucket: "keygallery-34dd1.appspot.com",
  //       messagingSenderId: "116706487441",
  //       appId: "1:116706487441:web:949cc5166bb25fa1092330",
  //       measurementId: "G-TXNB1QVY5F"
  //   ),
  // );
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
      home: const SplashScreen(),
    );
  }
}