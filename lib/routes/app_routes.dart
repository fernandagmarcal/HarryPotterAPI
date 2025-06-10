import 'package:flutter/material.dart';
import '../models/character.dart';
import '../screens/main_screen.dart';          
import '../screens/failure_screen.dart';      
import '../screens/loading_screen.dart';       
import '../screens/success_screen.dart';
import '../scenes/timeline_screen/timeline_screen.dart';
import '../scenes/post_screen/post_screen.dart';
import '../screens/history_screen.dart';
import '../screens/dictionary_screen.dart';
import '../screens/wands_screen.dart';

class AppRoutes {
  // rotas com consts estáticas
  static const String home = '/home';
  static const String charactersTimeline = '/personagens';
  static const String characterDetail = '/personagem_detalhe';
  static const String history = '/historia';
  static const String dictionary = '/dicionario';
  static const String wands = '/varinhas';
  // rotas da API
  static const String loading = '/carregando';
  static const String success = '/sucesso';
  static const String failure = '/erro';

  // mapa de rotas usado no MaterialApp
  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const MainScreen(),
      charactersTimeline: (context) => const TimelineScreen(),
      characterDetail: (context) => const PostScreen(),
      loading: (context) => const LoadingScreen(message: "Carregando..."),
      success: (context) => const SuccessScreen(characters: [], messageTitle: "Sucesso!",),
      failure: (context) => const FailureScreen(message: "Ocorreu um erro."),
      history: (context) => const HistoryScreen(),
      //dictionary: (context) => const DictionaryScreen(),
      //wands: (context) => const WandsScreen(),
    };
  }
}





