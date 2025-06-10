// main.dart

import 'package:flutter/material.dart';
import './routes/app_routes.dart'; // <<< Importe seu novo arquivo de rotas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mundo HP', // Um título mais genérico e adequado para o app
      theme: ThemeData(primarySwatch: Colors.blue),
      // rota inicial
      initialRoute: AppRoutes.home,
      // mapa de rotas
      routes: AppRoutes.routes,

      // Opcional: Se você decidir usar onGenerateRoute para lidar com passagem de argumentos
      // ou rotas dinâmicas/não encontradas, você usaria essa propriedade.
      // Neste caso, você comentaria a linha 'routes: AppRoutes.routes,'.
      // onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}