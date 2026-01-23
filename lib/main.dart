import 'package:flutter/material.dart';
import 'screens/onboarding.dart';
import 'screens/login.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'CalSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const Onboarding(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
      },
    );
  }
}
