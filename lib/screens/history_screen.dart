// // lib/screens/history_screen.dart
//
// import 'package:flutter/material.dart';
// import '../routes/app_routes.dart'; // Para a rota nomeada da Home
// import '../ui/app_colors.dart'; // Para suas cores personalizadas (se tiver)
//
// class HistoryScreen extends StatelessWidget {
//   static const String routeName = AppRoutes.history; // Usando a constante de AppRoutes
//
//   const HistoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.azulEscuro, // Usando sua cor personalizada
//         elevation: 4,
//         centerTitle: true,
//         title: const Text(
//           'História de Harry Potter',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//             color: Colors.white,
//           ),
//         ),
//         // Botão de voltar para a tela inicial (MainScreen)
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             // Opção 1: Volta para a tela anterior na pilha (mais comum)
//             Navigator.pop(context);
//
//             // Opção 2: Volta especificamente para a tela Home e substitui a atual (se você não quiser a HistoryScreen na pilha)
//             // Navigator.pushReplacementNamed(context, AppRoutes.home);
//           },
//         ),
//       ),
//       body: SingleChildScrollView( // Permite rolagem se o texto for longo
//         padding: const EdgeInsets.all(20.0), // Padding ao redor do conteúdo
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
//           children: [
//             Text(
//               'A saga Harry Potter, escrita por J.K. Rowling, conta a história de um garoto órfão que vive com os tios até descobrir, aos 11 anos, que é um bruxo. Ele recebe uma carta da Escola de Magia e Bruxaria de Hogwarts e entra em um mundo completamente novo, cheio de magia, criaturas fantásticas e mistérios.',
//               style: const TextStyle(fontSize: 16, height: 1.5), // height para espaçamento entre linhas
//               textAlign: TextAlign.justify, // Justifica o texto
//             ),
//             const SizedBox(height: 20), // Espaçamento entre parágrafos
//             Text(
//               'Em Hogwarts, Harry faz grandes amigos, como Rony Weasley e Hermione Granger, e também descobre que é famoso no mundo bruxo por ter sobrevivido ao ataque do poderoso bruxo das trevas, Lord Voldemort, quando ainda era um bebê. Ao longo dos anos, ele enfrenta desafios, aprende feitiços, participa de competições mágicas e descobre verdades sobre seu passado.',
//               style: const TextStyle(fontSize: 16, height: 1.5),
//               textAlign: TextAlign.justify,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'A série acompanha a evolução de Harry desde sua chegada à escola até a batalha final contra Voldemort, que busca retornar ao poder e dominar o mundo mágico. Com coragem, lealdade e união, Harry e seus amigos lutam para proteger Hogwarts e derrotar as forças do mal.',
//               style: const TextStyle(fontSize: 16, height: 1.5),
//               textAlign: TextAlign.justify,
//             ),
//             const SizedBox(height: 20),
//             Text(
//               'Com sete livros e oito filmes, Harry Potter conquistou fãs no mundo todo e se tornou uma das histórias mais populares da literatura e do cinema, abordando temas como amizade, escolhas, coragem e o poder do amor.',
//               style: const TextStyle(fontSize: 16, height: 1.5),
//               textAlign: TextAlign.justify,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../ui/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName = AppRoutes.history;

  const HistoryScreen({super.key});

  Widget buildWrappedSection(Widget child) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: child,
      ),
    );
  }

  Widget buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          height: 1.6,
          color: AppColors.brancoPadrao,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.azulEscuro,
        elevation: 4,
        centerTitle: true,
        // title: const Text(
        //   'História de Harry Potter',
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 20,
        //     color: AppColors.marromClaro,
        //   ),
        // ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.menu_book, color: AppColors.marromClaro),
            const SizedBox(width: 8), // Espaço entre o ícone e o texto
            const Text(
              'Sobre Harry Potter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.brancoPadrao, // Cor do texto do título
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: buildWrappedSection(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '💫 Uma Jornada Mágica 💫',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.marromClaro,
                ),
              ),
              const SizedBox(height: 20),
              buildParagraph(
                'A saga Harry Potter, escrita por J.K. Rowling, é uma das mais amadas do mundo. A história começa com Harry, um garoto órfão que vive em um armário sob as escadas na casa dos tios. Sua vida muda para sempre ao descobrir, aos 11 anos, que é um bruxo e que foi aceito na Escola de Magia e Bruxaria de Hogwarts.',
              ),
              buildParagraph(
                'Em Hogwarts, Harry descobre que é famoso por ter sobrevivido, ainda bebê, a um ataque do terrível Lord Voldemort — o bruxo das trevas mais temido de todos os tempos. Lá ele conhece seus fiéis amigos Rony Weasley e Hermione Granger, com quem vive aventuras mágicas, enfrenta perigos e forma laços inquebráveis.',
              ),
              buildParagraph(
                'Ao longo dos sete anos na escola, Harry desvenda segredos sobre seu passado, aprende magia, participa de torneios perigosos, enfrenta criaturas fantásticas e entra em confronto direto com Voldemort, que tenta retornar ao poder e dominar o mundo bruxo.',
              ),
              buildParagraph(
                'A história culmina em uma batalha épica em Hogwarts, onde Harry e seus aliados lutam com coragem, amor e união para proteger tudo o que é importante. A jornada de Harry é uma lição sobre amizade, escolhas e o verdadeiro significado do heroísmo.',
              ),
              buildParagraph(
                'Com sete livros e oito filmes, Harry Potter marcou gerações, emocionou milhões de fãs e se tornou um dos maiores fenômenos culturais da literatura e do cinema. É uma história sobre magia — mas, acima de tudo, sobre o poder do amor, da coragem e da amizade.',
              ),
              const Text(
                '✨ ',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: AppColors.marromClaro,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),),]),),
              const SizedBox(height: 50),
              const Text(
                'Fontes:\nharrypotter.fandom.com\nharrypotter.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: AppColors.azulClaro,),),
            ],
          ),
        ),
      ),
    );
  }
}
