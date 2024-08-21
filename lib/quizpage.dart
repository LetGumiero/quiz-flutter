import 'dart:async';

import 'package:flutter/material.dart';
import 'result_page.dart';
import 'data.dart';


class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionIndex = 0;
  int totalScore = 0;
  bool isCorrectAnswer = false;
  int timer = 30;
  String showTime = "30";

  void _answerQuestion(String answer) {
    timer = 30;
    final correctAnswer = questions[questionIndex]["correctAnswer"];
    if (answer == correctAnswer) {
      totalScore++;
      isCorrectAnswer = true;
    }

    setState(() {
      questionIndex++;
    });

    if (questionIndex >= questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(resultScore: totalScore),
        ),
      );
    }
  }

  void startTimer() {
    const sec = Duration(seconds: 1);
    Timer.periodic(sec, (Timer t) {
      if (timer <= 0) {
        t.cancel();
        _moveToNextQuestion();
      } else {
        setState(() {
          timer = timer - 1;
          showTime = timer.toString();
        });
      }
    });
  }

  void _moveToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        timer = 30;
        startTimer();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(resultScore: totalScore),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    questions.shuffle();
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Você tem $showTime segundos!',
          style: TextStyle(
            color: timer > 15 ? Colors.green : Colors.red,
            fontSize: 23.00,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: questionIndex < questions.length
          ? Quiz(
              questionData: questions[questionIndex],
              answerQuestion: _answerQuestion,
            )
          : const Text('Seu resultado é...')
        );
  }
}

class Quiz extends StatelessWidget {
  final Map<String, Object> questionData;
  final Function(String) answerQuestion;

  const Quiz({
    super.key,
    required this.questionData,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    final List options = questionData["options"] as List;

    return Column(
      children: [
        Question(
          questionData["question"] as String,
        ),
        ...options.map((option) {
          return Answer(() => answerQuestion(option["answer"] as String),
              option["answer"] as String);
        }).toList(),
      ],
    );
  }
}

class Feedback extends StatelessWidget {
  final String feedbackQuestion;

  const Feedback({
    super.key,
    required this.feedbackQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(feedbackQuestion));
  }
}

class Question extends StatelessWidget {
  final String questionText;

  const Question(this.questionText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  const Answer(this.selectHandler, this.answerText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
        ),
        onPressed: selectHandler,
        child: Text(answerText),
      ),
    );
  }
}
