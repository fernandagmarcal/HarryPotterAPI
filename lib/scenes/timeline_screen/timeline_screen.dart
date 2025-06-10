import 'package:flutter/material.dart';
import '../../models/character.dart';
import '../../screens/failure_screen.dart';
import '../../screens/loading_screen.dart';
import '../../screens/success_screen.dart';
import '../../utils/ApiService.dart';

class TimelineScreen extends StatefulWidget {
  static const routeName = '/personagens';
  final String messageTitle = "Explorar Personagens";
  final String messageDescription = "Lista de personagens de Harry Potter";
  final String messageErrorTitle = "Erro ao carregar os personagens! Reinicie o APP...";
  final String messageErrorDescription = "Não foi possível carregar os personagens. Tente novamente mais tarde!";

  const TimelineScreen({super.key});

  @override
  //<> anotação diamante , vai receber a classe de estado que vai gerenciar uma tela
  State<StatefulWidget> createState() {
    return _TimelineScreenState();
  }
}

//Vai gerenciar os estados e a renderizacao da cena MainScreen - AGORA TIMELINE
// MainsScreenState é um estado que vai gerenciar a tela mainscreen - AGORA TIMELINE

class _TimelineScreenState extends State<TimelineScreen> {
  int _timelineScreenState = 2; // 0: sucesso, 1: erro, 2: carregando
  List<Character>? _characters;

  // variável que guarda a lista de objetos 'Character'
  // O ? indica que a variável pode ser nula (sem valor atribuído)

  @override
  void initState() {
    super.initState();
    _carregaDados();
  }

  void incrementarEstado() {
    setState(() {
      _timelineScreenState++;
      _timelineScreenState %= 3;
    });
  }

  Future<void> _carregaDados() async {
    // 3 segundos de sleep
    await Future.delayed(Duration(seconds: 3));
    const url = "https://hp-api.onrender.com/api/characters"; // Api HP
    final response = await ApiService.request<List<Character>>(
      url: url,
      verb: HttpVerb.get,
      fromJson:
          (json) =>
          (json as List)
              .map(
                (item) => Character.fromJson(item as Map<String, dynamic>),
          )
              .toList(),
    );

    setState(() {
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          response.data != null) {
        _characters = response.data;
        _timelineScreenState = 0;
      } else {
        _timelineScreenState = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_timelineScreenState) {
      case 0:
        return SuccessScreen(
          characters: _characters!,
          messageTitle: widget.messageTitle,
        ); // passa a lista de personagens
      case 1:
        return FailureScreen(message: widget.messageErrorDescription);
      default:
        return LoadingScreen(message: "Carregando personagens...");
    }
  }
}
