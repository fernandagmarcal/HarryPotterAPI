import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../widgets/home_app_bar.dart';
import '../ui/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: HomeAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            const Text(
            'Seja bem-vindo!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.marromClaro,
              fontFamily: 'InterRegular',
              fontSize: 24,
              fontWeight: FontWeight.w800,)),
              const SizedBox(height: 5),
              const Text(
                'Prepare-se para mergulhar no mundo bruxo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'InterRegular',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brancoPadrao,),),
              const SizedBox(height: 25),
              Image.asset(
                'assets/images/logohome.png',
                height: 250,
                width: 180,
                fit: BoxFit.contain, // Garante que a imagem se ajuste sem cortar
              ),
              const SizedBox(height: 30),
              const Text(
                'Neste app, você encontra um resumo encantador da história de Harry Potter, um dicionário com termos mágicos e um guia completo sobre varinhas. Também pode explorar detalhes dos personagens e feitiços mais icônicos da saga!\n \n',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'InterRegular',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  color: AppColors.marromClaro,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),),]),),
              const Text(
                '✨ Créditos (API): hp-api.onrender.com ✨',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'InterRegular',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
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
                context, 'Dicionário Mágico', AppRoutes.dictionary, Icons.electric_bolt, AppColors.marromClaro, Colors.white),
              const SizedBox(height: 25),

              _buildNavigationButton(
                context, 'Varinhas Mágicas', AppRoutes.wands, Icons.flare, AppColors.marromClaro, Colors.white),
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
                  textStyle: const TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
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
                    fontFamily: 'InterRegular',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    color: AppColors.brancoPadrao,
                    shadows: [
                      Shadow(
                        blurRadius: 5.0,
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),),]),),
              const SizedBox(height: 10),
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
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'InterRegular', fontWeight: FontWeight.w800),
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
