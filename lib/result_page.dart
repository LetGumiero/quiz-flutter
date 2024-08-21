import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int resultScore;
  final String feedbackMessage;

  
   static String generateFeedbackMessage(int score) {
    if (score == 10) {
      return "Uau! Seu entendimento sobre segurança é incrível! Sua dedicação em manter suas informações seguras é notável. Continue assim!";
    } else if (score < 10 && score > 7) {
      return "Você já demonstrou um bom entendimento de segurança, e admiramos seu compromisso com a proteção dos seus dados. Você pode aprimorar ainda mais sua segurança online se praticar mais e ler nossos artigos! Estamos aqui para apoiá-lo nesse processo!";
    } else if (score < 8 && score > 4) {
      return "É incrível ver você mostrando interesse em aprender sobre segurança digital! Estar consciente da importância de proteger suas informações online é o primeiro passo para uma navegação mais segura na internet. Continue explorando e aprendendo, e estaremos aqui para ajudar sempre que precisar!";
    } else if (score < 4) {
      return "É admirável ver seu interesse em aprender mais sobre segurança digital! Embora seja um assunto que pode parecer desafiador, sua dedicação em entender é um ótimo começo. Lembre-se de que todos nós estamos em constante aprendizado nesse campo. Estamos aqui para apoiá-lo nessa jornada!";
    } else {
      return "Algo deu errado, tente novamente!";
    }
  }

  ResultPage({super.key, required this.resultScore})
      : feedbackMessage = generateFeedbackMessage(resultScore);
       static const routeName = 'result';

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfiniteQuiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0), 
          child: Text(
            'Você acertou $resultScore questões.\n\n$feedbackMessage',
            style: const TextStyle(fontSize: 23),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}