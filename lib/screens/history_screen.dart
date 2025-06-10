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
                'Uma Jornada Mágica! 💫',
                style: TextStyle(
                  fontSize: 24,
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
