import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'quizpage.dart';
import 'result_page.dart';


void main() => runApp(const InfiniteQuizApp());


class InfiniteQuizApp extends StatelessWidget {
  const InfiniteQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfiniteQuiz',
      theme: ThemeData(
        fontFamily: 'Rahere Sans Extra Bold',
      ),
      initialRoute: '/',
       routes: {
        '/': (context) => const WelcomePage(),
        '/quiz': (context) => const QuizPage(),
        ResultPage.routeName: (context) =>  ResultPage(resultScore: 0),
      },
    );
  }
}
