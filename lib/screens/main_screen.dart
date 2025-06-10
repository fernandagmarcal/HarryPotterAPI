import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../ui/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Mundo de Harry Potter!'),
        centerTitle: true, // Centraliza o título
        backgroundColor: AppColors.azulEscuro, // Adiciona cor à AppBar
        foregroundColor: Colors.white, // Cor do texto e ícones na AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Este aplicativo explora os personagens, a história e os mistérios do mundo bruxo de Harry Potter.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50),

              _buildNavigationButton(
                context, 'Ver Personagens', AppRoutes.charactersTimeline,),
              const SizedBox(height: 20),

              _buildNavigationButton(
                context, 'Sobre Harry Potter', AppRoutes.history,),
              const SizedBox(height: 20),

              _buildNavigationButton(
                context, 'Dicionário', AppRoutes.dictionary,),
              const SizedBox(height: 20),

              _buildNavigationButton(
                context, 'Varinhas', AppRoutes.wands,),
              const SizedBox(height: 40),

              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('A funcionalidade "Sair" geralmente é gerenciada pelo sistema operacional.'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                },
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
            ],
          ),
        ),
      ),
    );
  }

  // função dos botões de navegação
  Widget _buildNavigationButton(BuildContext context, String text, String routeName) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.azulEscuro,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: Text(text),
    );
  }
}