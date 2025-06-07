import 'package:flutter/material.dart';
import './screens/main_screen.dart';
import './scenes/timeline_screen/timeline_screen.dart'; // Importe a TimelineScreen
import './scenes/post_screen/post_screen.dart';     // Importe a PostScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timeline de Personagens',
      theme: ThemeData(primarySwatch: Colors.brown),
      // home: const MainScreen(), // Remova a definição direta do home
      initialRoute: '/', // Rota inicial
      routes: {
        '/': (context) => const MainScreen(), // Rota para sua tela principal atual
        TimelineScreen.routeName: (context) => const TimelineScreen(), // Rota para a TimelineScreen
        PostScreen.routeName: (context) => PostScreen(
          post: ModalRoute.of(context)?.settings.arguments, // Recebe os argumentos
        ), // Rota para a PostScreen
      },
    );
  }
}