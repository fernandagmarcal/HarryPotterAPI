import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../ui/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text('Bem-vindo ao Universo de Harry Potter!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.marromClaro,),),
        centerTitle: true,
        backgroundColor: AppColors.azulPrincipal,
        foregroundColor: AppColors.marromClaro,),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/harry-potter.png',
                height: 250,
                width: 180,
                fit: BoxFit.contain, // Garante que a imagem se ajuste sem cortar
              ),
              const SizedBox(height: 60),
              const Text(
                'Prepare-se para mergulhar no mundo bruxo!\nNeste app, você encontra um resumo encantador da história de Harry Potter,\n'
                    'um dicionário com termos mágicos e um guia completo sobre varinhas.\n'
                    'Também pode explorar detalhes dos personagens icônicos da saga!\n \n',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: AppColors.marromClaro,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),),]),),
              const Text(
                '✨ Fonte dos dados dos personagens (API): hp-api.onrender.com ✨',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: AppColors.brancoPadrao,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),),]),),
              const SizedBox(height: 60),

              _buildNavigationButton(
                  context, 'Sobre Harry Potter', AppRoutes.history, Icons.menu_book, AppColors.marromClaro, Colors.white),
              const SizedBox(height: 25),

              _buildNavigationButton(
                context, 'Explorar Personagens', AppRoutes.charactersTimeline, Icons.people_alt, AppColors.marromClaro, Colors.white),
              const SizedBox(height: 25),

              _buildNavigationButton(
                context, 'Ler o Dicionário', AppRoutes.dictionary, Icons.electric_bolt, AppColors.marromClaro, Colors.white),
              const SizedBox(height: 25),

              _buildNavigationButton(
                context, 'Varinha Mágica', AppRoutes.wands, Icons.flare_sharp, AppColors.marromClaro, Colors.white),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A funcionalidade "Sair" geralmente é gerenciada pelo sistema operacional.'),
                      duration: Duration(seconds: 3),),);},
                icon: const Icon(Icons.exit_to_app),
                label: const Text('Sair do App'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azulClaro,
                  foregroundColor: AppColors.azulEscuro,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Text(
                'Mobile I: por Fernanda Galvão\n''Prof.: Silvano Malfatti',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: AppColors.brancoPadrao,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),),]),),
            ],
          ),
        ),
      ),
    );
  }

  // função dos botões de navegação
  Widget _buildNavigationButton(
      BuildContext context,
      String text,
      String routeName,
      IconData iconData,
      Color iconColor,
      Color textColor,) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.azulEscuro,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: iconColor),
          const SizedBox(width: 12),
          Text(text, style: TextStyle(color: textColor)),
        ],
      ),
    );
  }
}
