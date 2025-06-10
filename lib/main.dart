import 'package:flutter/material.dart';
import './routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Universo Harry Potter', // Um título mais genérico e adequado para o app
      theme: ThemeData(primarySwatch: Colors.blue),
      // rota inicial
      initialRoute: AppRoutes.home,
      // mapa de rotas
      routes: AppRoutes.routes,
    );
  }
}