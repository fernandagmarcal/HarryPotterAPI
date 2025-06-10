// lib/screens/history_screen.dart

import 'package:flutter/material.dart';
import '../routes/app_routes.dart'; // Para a rota nomeada da Home
import '../ui/app_colors.dart'; // Para suas cores personalizadas (se tiver)

class HistoryScreen extends StatelessWidget {
  // Define a rota nomeada para esta tela
  static const String routeName = AppRoutes.history; // Usando a constante de AppRoutes

  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.azulEscuro, // Usando sua cor personalizada
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'História de Harry Potter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        // Botão de voltar para a tela inicial (MainScreen)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Opção 1: Volta para a tela anterior na pilha (mais comum)
            Navigator.pop(context);

            // Opção 2: Volta especificamente para a tela Home e substitui a atual (se você não quiser a HistoryScreen na pilha)
            // Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
        ),
      ),
      body: SingleChildScrollView( // Permite rolagem se o texto for longo
        padding: const EdgeInsets.all(20.0), // Padding ao redor do conteúdo
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
          children: [
            Text(
              'A saga Harry Potter, escrita por J.K. Rowling, conta a história de um garoto órfão que vive com os tios até descobrir, aos 11 anos, que é um bruxo. Ele recebe uma carta da Escola de Magia e Bruxaria de Hogwarts e entra em um mundo completamente novo, cheio de magia, criaturas fantásticas e mistérios.',
              style: const TextStyle(fontSize: 16, height: 1.5), // height para espaçamento entre linhas
              textAlign: TextAlign.justify, // Justifica o texto
            ),
            const SizedBox(height: 20), // Espaçamento entre parágrafos
            Text(
              'Em Hogwarts, Harry faz grandes amigos, como Rony Weasley e Hermione Granger, e também descobre que é famoso no mundo bruxo por ter sobrevivido ao ataque do poderoso bruxo das trevas, Lord Voldemort, quando ainda era um bebê. Ao longo dos anos, ele enfrenta desafios, aprende feitiços, participa de competições mágicas e descobre verdades sobre seu passado.',
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Text(
              'A série acompanha a evolução de Harry desde sua chegada à escola até a batalha final contra Voldemort, que busca retornar ao poder e dominar o mundo mágico. Com coragem, lealdade e união, Harry e seus amigos lutam para proteger Hogwarts e derrotar as forças do mal.',
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            Text(
              'Com sete livros e oito filmes, Harry Potter conquistou fãs no mundo todo e se tornou uma das histórias mais populares da literatura e do cinema, abordando temas como amizade, escolhas, coragem e o poder do amor.',
              style: const TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}