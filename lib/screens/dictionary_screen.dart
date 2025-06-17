import 'package:flutter/material.dart';
import 'package:hp_api/widgets/telas_app_bar.dart';
import '../routes/app_routes.dart';
import '../ui/app_colors.dart';

class DictionaryTerm {
  final String term;
  final String definition;
  final String _firstLetter;

  DictionaryTerm({required this.term, required this.definition})
      : _firstLetter = term.isNotEmpty ? term[0].toUpperCase() : '';

  String get firstLetter => _firstLetter;
}

// dados dicio
final Map<String, List<Map<String, String>>> _dictionaryData = {
  'A': [
    {'Alohomora': 'Feitiço usado para destrancar portas.'},
    {'Acapulco': 'Criatura mágica que se assemelha a um macaco com asas e cauda preênsil.'},
    {'Animago': 'Bruxo ou bruxa que pode se transformar em um animal à vontade.'},
    {'Aragog': 'Acromântula gigante que vive na Floresta Proibida, amiga de Hagrid.'},
    {'Avada Kedavra': 'A Maldição da Morte. Uma das três Maldições Imperdoáveis.'},
    {'Azkaban': 'Prisão dos bruxos, vigiada por dementadores.'},
  ],
  'B': [
    {'Basilisco': 'Cobra gigante cujo olhar pode matar.'},
    {'Beco Diagonal': 'Rua comercial em Londres onde os bruxos compram seus suprimentos.'},
    {'Bicuço': 'Hipogrifo, uma criatura com cabeça de águia e corpo de cavalo.'},
    {'Bicho-Papão': 'Criatura que assume a forma do maior medo da pessoa.'},
    {'Bruxo/Bruxa': 'Pessoa capaz de usar magia. Nascem em famílias bruxas ou trouxas.'},
  ],
  'C': [
    {'Capa da Invisibilidade': 'Um dos três artefatos das Relíquias da Morte, torna o usuário invisível.'},
    {'Casa': 'Hogwarts tem quatro casas: Grifinória, Sonserina, Corvinal e Lufa-Lufa. Cada aluno é selecionado para uma delas.'},
    {'Centauro': 'Criatura com cabeça e tronco de humano e corpo de cavalo.'},
    {'Comunal': 'Sala de estar de cada casa em Hogwarts, acessível apenas aos membros da casa.'},
    {'Corvinal': 'Casa de Hogwarts dos inteligentes, criativos e sábios. Representada por uma águia.'},
  ],
  'D': [
    {'Dementador': 'Criatura sombria que se alimenta da felicidade e pode aplicar o "beijo do dementador".'},
    {'Dobby': 'Elfo doméstico que se torna amigo e leal a Harry Potter.'},
    {'Dumbledore': 'Diretor de Hogwarts, sábio e poderoso aliado de Harry Potter.'},
  ],
  'E': [
    {'Elfo Doméstico': 'Criatura mágica ligada por magia a uma família bruxa, a quem serve.'},
    {'Expelliarmus': 'Feitiço de desarmamento, muito usado por Harry.'},
  ],
  'F': [
    {'Feitiço Patrono': 'Cria um patrono que afasta dementadores; exige uma memória feliz.'},
    {'Fênix': 'Criatura mágica que renasce das cinzas. Fawkes, a fênix de Dumbledore, é uma das mais conhecidas.'},
    {'Floresta Proibida': 'Grande floresta nos arredores de Hogwarts, lar de muitas criaturas mágicas perigosas.'},
    {'Forcejamento': 'Habilidade mágica de se comunicar com cobras.'},
  ],
  'G': [
    {'Gringotes': 'Banco dos bruxos, administrado por duendes.'},
    {'Grifinória': 'Casa de Hogwarts dos corajosos e leais. Representada por um leão.'},
  ],
  'H': [
    {'Hogsmeade': 'Vila bruxa próxima a Hogwarts, acessível aos alunos a partir do 3º ano.'},
    {'Hogwarts': 'Escola de Magia e Bruxaria do Reino Unido.'},
  ],
  'I': [
    {'Imperius': 'Maldição Imperdoável que permite ao lançador controlar a vítima.'},
    {'Inferi': 'Cadáveres reanimados por magia negra.'},
  ],
  'L': [
    {'Legilimência': 'A arte mágica de navegar ou ver as memórias e os sentimentos de outra pessoa.'},
    {'Lufa-Lufa': 'Casa de Hogwarts dos justos, pacientes e leais. Representada por um texugo.'},
    {'Lumos': 'Feitiço que acende luz na ponta da varinha.'},
  ],
  'M': [
    {'Maldições Imperdoáveis': 'Três feitiços de magia negra considerados os mais cruéis e ilegais: Avada Kedavra, Crucio e Imperius.'},
    {'Mapa do Maroto': 'Mapa mágico que mostra toda Hogwarts em tempo real, inclusive pessoas e passagens secretas.'},
    {'Mestiço': 'Bruxo nascido de pais com linhagem mista (bruxo e trouxa).'},
    {'Ministério da Magia': 'Órgão do governo mágico britânico.'},
    {'Mundo Bruxo': 'A sociedade e cultura oculta de bruxos e bruxas que vivem paralelamente ao mundo trouxa.'},
  ],
  'N': [
    {'Neville Longbottom': 'Estudante de Grifinória, inicialmente tímido, torna-se um herói na batalha final.'},
    {'Nômade': 'Bruxo ou bruxa que nasce de dois pais trouxas.'},
  ],
  'O': [
    {'Oclumência': 'A arte mágica de proteger a mente de intrusões ou influências externas, como a Legilimência.'},
    {'Ordem da Fênix': 'Sociedade secreta fundada por Dumbledore para lutar contra Lord Voldemort.'},
  ],
  'P': [
    {'Pensadeira': 'Artefato mágico que permite a uma pessoa revisar e armazenar memórias.'},
    {'Petrificus Totalus': 'Feitiço que paralisa totalmente a pessoa.'},
    {'Pomo de Ouro': 'Pequena bola dourada usada no quadribol. Sua captura encerra o jogo.'},
    {'Poção Polissuco': 'Poção complexa que permite assumir a aparência de outra pessoa.'},
    {'Puro-sangue': 'Bruxo ou bruxa nascido de pais ambos bruxos, sem linhagem trouxa conhecida.'},
  ],
  'Q': [
    {'Quadribol': 'Esporte bruxo jogado em vassouras, com quatro bolas e sete jogadores por time.'},
  ],
  'R': [
    {'Relíquias da Morte': 'Três objetos lendários: a Varinha das Varinhas, a Pedra da Ressurreição e a Capa da Invisibilidade.'},
    {'Rony Weasley': 'Melhor amigo de Harry, membro da Grifinória e da família Weasley.'},
  ],
  'S': [
    {'Sonserina': 'Casa conhecida por sua ambição e astúcia. Representada por uma serpente.'},
    {'Severo Snape': 'Professor de Poções em Hogwarts, personagem complexo e essencial à trama.'},
  ],
  'T': [
    {'Transfiguração': 'Ramo da magia que transforma um objeto ou ser em outro.'},
    {'Trouxa': 'Pessoa sem poderes mágicos.'},
  ],
  'V': [
    {'Varinha': 'Instrumento mágico essencial para canalizar feitiços.'},
    {'Vira-tempo': 'Objeto mágico que permite ao usuário viajar no tempo.'},
    {'Voldemort': 'Principal antagonista da série. Também chamado de “Você-Sabe-Quem”.'},
  ],
};


class DictionaryScreen extends StatefulWidget {
  static const String routeName = AppRoutes.dictionary;

  const DictionaryScreen({super.key});

  @override
  State<DictionaryScreen> createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {

  // Helper para construir um item de dicionário (termo e definição)
  Widget _buildDictionaryItem(String word, String definition) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            word,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppColors.azulEscuro,),),
          const SizedBox(height: 10),
          Text(
            definition, style: TextStyle(fontSize: 15, color: AppColors.azulEscuro,), textAlign: TextAlign.left,),],),);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> sortedLetters = _dictionaryData.keys.toList()..sort();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: TelasAppBar(),
      body: Column(
        children: [
          // Conteúdo Principal: Lista Expansível
          Expanded(
            child: sortedLetters.isEmpty
                ? Center(
              child: Text(
                'Dicionário vazio.',
                style: TextStyle(fontSize: 18, color: AppColors.azulEscuro),
                textAlign: TextAlign.left,),)
                : ListView( // Usar ListView (não Builder) se o número de filhos é pequeno e fixo
              children: sortedLetters.map((letter) {
                final terms = _dictionaryData[letter]!; // Obter termos para a letra
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), elevation: 6, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  child: Theme( // Tema para estilizar ExpansionTile
                    data: Theme.of(context).copyWith(
                      dividerColor: Colors.transparent,
                      unselectedWidgetColor: AppColors.marromClaro,
                      textTheme: Theme.of(context).textTheme.copyWith(
                        bodyMedium: TextStyle(color: AppColors.azulEscuro),
                      ),
                    ),
                    child: ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      title: Text(
                        letter,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.azulEscuro,),),
                      children: terms.map((termMap) {
                        final word = termMap.keys.first;
                        final definition = termMap.values.first;
                        return Column(
                          children: [
                            Divider(height: 1, color: AppColors.marromClaro), // Divisor entre termos
                            _buildDictionaryItem(word, definition),],);}).toList(),),),);}).toList(),),),],),
    );
  }
}