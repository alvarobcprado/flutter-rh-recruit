import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'pages/splash/splash-page.dart';
import 'pages/home/home-page.dart';
import 'pages/candidates/candidates-page.dart';
import 'pages/signature/signature-page.dart';
import 'pages/interview/interview-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trabalho Computação Móvel',
      theme: ThemeData(
        primarySwatch: customColor(Color(0xFF193283)),
        primaryColor: Color(0xFF193283),
      ),
      // Rotas das páginas
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/home': (context) => HomePage(),
        '/candidates': (context) => CandidatesPage(),
        '/signature': (context) => SignaturePage(),
        '/interview': (context) => InterviewPage(),
      },
    );
  }
}
