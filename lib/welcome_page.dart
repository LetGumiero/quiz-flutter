import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'InfiniteQuiz',
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bem vindo ao InfiniteQuiz!!!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'O InfiniteQuiz é um jogo de perguntas e respostas sobre segurança! '
              'O InfiniteQuiz foi feito pela InfinitePay pensando na sua segurança, '
              'para que você aprenda a se proteger e tenha mais tranquilidade no seu '
              'dia-a-dia! Assim, você aprende as melhores formas de se prevenir de qualquer '
              'possível ação má intencionada, e assim seu precioso dinheiro ficará '
              'seguro para que você o use com o que realmente importa, que é com você!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, 
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(10)
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
    
              },
              child: const Text('Iniciar Jogo', style: TextStyle(fontSize: 20, )),
              
            ),
          ],
        ),
      ),
    );
  }
}
