import 'package:flutter/material.dart';
import '../models/character.dart';
import '../scenes/post_screen/post_screen.dart';
import '../scenes/timeline_screen/timeline_screen.dart';
import '../ui/app_colors.dart';
import '../routes/app_routes.dart';

// 1. Converter SuccessScreen para StatefulWidget
class SuccessScreen extends StatefulWidget {
  final List<Character> characters;
  final String messageTitle;
  final VoidCallback? onRefresh;

  const SuccessScreen({
    super.key,
    required this.characters,
    required this.messageTitle,
    this.onRefresh,
  });

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late TextEditingController _searchController;
  List<Character> _originalCharacters = [];
  List<Character> _filteredCharacters = [];

  @override
  void initState() {
    super.initState();
    // Inicializa as listas com os personagens recebidos
    _originalCharacters = widget.characters;
    _filteredCharacters = _originalCharacters;

    // Inicializa o controlador da barra de pesquisa e adiciona um listener
    _searchController = TextEditingController();
    _searchController.addListener(_filterCharacters);
  }

  @override
  void dispose() {
    _searchController.dispose(); // Descarta o controlador para evitar vazamentos de memória
    super.dispose();
  }

  // Método para filtrar os personagens com base na pesquisa
  void _filterCharacters() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCharacters = _originalCharacters; // Se a pesquisa estiver vazia, mostra todos
      } else {
        _filteredCharacters = _originalCharacters.where((character) {
          // Filtra por nome, espécie, gênero ou casa (você pode adicionar mais campos)
          return character.name.toLowerCase().contains(query) ||
              (character.species?.toLowerCase().contains(query) ?? false) ||
              (character.gender?.toLowerCase().contains(query) ?? false) ||
              (character.house?.toLowerCase().contains(query) ?? false);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.azulEscuro,
        elevation: 4,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.people_alt, color: AppColors.marromClaro),
            const SizedBox(width: 8),
            Text(
              widget.messageTitle, // Usar widget.messageTitle
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,),),],),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TimelineScreen()),
              );
            },
          ),
        ],
      ),
      // Corpo da tela: Coluna para barra de pesquisa e lista de personagens
      body: Column( // Alterar de Center para Column para empilhar os widgets
        children: [
          // Barra de Pesquisa (TextField)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Pesquisar personagem...',
                hintStyle: TextStyle(color: AppColors.azulEscuro.withOpacity(0.6)),
                prefixIcon: Icon(Icons.search, color: AppColors.marromClaro),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                  icon: Icon(Icons.clear, color: AppColors.marromClaro),
                  onPressed: () {
                    _searchController.clear(); // Limpa o texto
                    _filterCharacters(); // E re-filtra (mostra todos)
                    FocusScope.of(context).unfocus(); // Fecha o teclado
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.azulEscuro, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.azulEscuro, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.azulEscuro, width: 2.5),
                ),
                filled: true,
                fillColor: Colors.white, // Fundo branco para a barra de pesquisa
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
              style: TextStyle(color: AppColors.azulEscuro, fontSize: 16.0),
              cursorColor: AppColors.azulEscuro,
            ),
          ),
          // Lista de Personagens Filtrada (Expandida para preencher o resto do espaço)
          Expanded( // O Expanded é crucial para que o ListView.builder ocupe o espaço restante
            child: _filteredCharacters.isEmpty
                ? Center(
              child: Text(
                _searchController.text.isEmpty
                    ? 'Nenhum personagem encontrado.' // Quando a lista original está vazia
                    : 'Nenhum resultado para "${_searchController.text}".', // Quando a pesquisa não encontra
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.azulEscuro,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            )
                : ListView.builder(
              itemCount: _filteredCharacters.length,
              itemBuilder: (context, index) {
                final character = _filteredCharacters[index]; // Usar a lista filtrada
                return _buildCharacterItem(context, character);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Função para construir o item do personagem (Card) - Permanece a mesma
  Widget _buildCharacterItem(BuildContext context, Character character) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.characterDetail,
            arguments: character,
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name ?? 'Nome Desconhecido',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: AppColors.azulEscuro,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    _buildInfoRow('Espécie', character.species, Icons.psychology),
                    _buildInfoRow('Gênero', character.gender, Icons.person),
                    _buildInfoRow('Casa', character.house, Icons.castle),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              if (character.image != null && character.image!.isNotEmpty)
                Hero(
                  tag: 'character_image_${character.id}',
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.marromClaro.withOpacity(0.2),
                    backgroundImage: NetworkImage(character.image!),
                    onBackgroundImageError: (exception, stackTrace) {
                      debugPrint('Erro ao carregar imagem para ${character.name}: $exception');
                    },
                  ),
                )
              else
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.marromClaro.withOpacity(0.2),
                  child: Icon(Icons.person, size: 40, color: AppColors.marromClaro),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper para exibir informações de forma consistente
  Widget _buildInfoRow(String label, String? value, IconData icon) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.marromClaro),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$label: ${value.trim()}',
              style: TextStyle(fontSize: 16, color: AppColors.azulEscuro),
            ),
          ),
        ],
      ),
    );
  }
}