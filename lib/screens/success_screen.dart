import 'package:flutter/material.dart';
import '../models/character.dart';
import '../ui/app_colors.dart';

class SuccessScreen extends StatelessWidget {
  final List<Character> characters;
  final String messageTitle;

  const SuccessScreen({
    super.key,
    required this.characters,
    required this.messageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.azulEscuro, // Cor de fundo da AppBar
        elevation: 4, // Sombra
        centerTitle: true, // Centraliza o título
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, color: AppColors.marromClaro),
            SizedBox(width: 8),
            Text(
              messageTitle,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SuccessScreen(characters: [], messageTitle: '',)),
              );
            },
          ),
        ],
      ),
      body: characters.isEmpty
          ? const Center(child: Text('Nenhum personagem encontrado.'))
          : ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return _buildCharacterItem(character);
        },
      ),
    );
  }

  Widget _buildCharacterItem(Character character) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              character.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            if (character.image.isNotEmpty)
              Image.network(
                character.image,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8.0),
            Text('✴ Espécie: ${character.species}'),
            Text('👤 Gênero: ${character.gender}'),
            Text('✨ Casa: ${character.house}'),
            Text('📅 Nascimento: ${character.dateOfBirth.isNotEmpty ? character.dateOfBirth : 'Desconhecido'}',),
            Text('🧙‍♂️ Mago: ${character.wizard ? 'Sim' : 'Não'}'),
            Text('💫 Ancestralidade: ${character.ancestry.isNotEmpty ? character.ancestry : 'Desconhecida'}',),
            Text('🔹 Varinha: ${character.wand}'),
            Text('💡 Patronus: ${character.patronus.isNotEmpty ? character.patronus : 'Desconhecido'}',),
            Text('🏠 Estudante de Hogwarts: ${character.hogwartsStudent ? 'Sim' : 'Não'}',),
            Text('👑 Membro da Staff de Hogwarts: ${character.hogwartsStaff ? 'Sim' : 'Não'}',),
            Text('💠 Status: ${character.alive ? 'Vivo' : 'Morto'}'),
          ],
        ),
      ),
    );
  }
}
