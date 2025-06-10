// lib/scenes/post_screen/post_screen.dart

import 'package:flutter/material.dart';
import 'package:rm_api/models/character.dart'; // Certifique-se que o import para seu Character está correto

class PostScreen extends StatelessWidget {
  // A rota nomeada para esta tela. Mantenha consistente com app_routes.dart.
  // Eu sugeri '/personagem_detalhe' em AppRoutes, mas você pode usar '/post' se preferir.
  // O importante é que seja o mesmo nome em AppRoutes e no pushNamed.
  static const String routeName = '/post'; // Usando o nome que você já tinha

  // REMOVA OS PARÂMETROS 'post' e 'character' do construtor.
  // A tela receberá os argumentos via ModalRoute.of(context).settings.arguments.
  const PostScreen({super.key}); // O construtor agora é simples

  @override
  Widget build(BuildContext context) {
    // 1. Acessa os argumentos passados pela rota.
    // O 'arguments' pode ser qualquer coisa que você passar (Map, Character, String, int).
    final dynamic args = ModalRoute.of(context)?.settings.arguments;

    // 2. Tenta fazer um cast para o seu modelo Character.
    // Isso é seguro porque verifica o tipo em tempo de execução.
    final Character? character = args is Character ? args : null;

    // 3. Verifica se o personagem foi recebido e é válido.
    if (character == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Erro: Detalhes do Personagem'),
          backgroundColor: Colors.redAccent, // Uma cor para indicar erro
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 50, color: Colors.red),
              SizedBox(height: 16),
              Text(
                'Nenhum personagem selecionado ou dados inválidos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ],
          ),
        ),
      );
    }

    // 4. Se o personagem foi recebido, construa a UI com base nos dados dele.
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes de ${character.name ?? 'Personagem'}'), // Título dinâmico
        backgroundColor: Colors.brown, // Sua cor de tema
        // Botão de voltar padrão do Flutter é adicionado automaticamente se não for a rota inicial
        // ou você pode adicionar um leading: IconButton aqui se preferir.
      ),
      body: SingleChildScrollView( // Garante que a tela pode rolar se o conteúdo for muito longo
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha o texto à esquerda
          children: [
            // Exibir a foto do personagem
            if (character.image != null && character.image!.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect( // Para arredondar as bordas da imagem
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      character.image!,
                      height: 250, // Altura ajustável
                      fit: BoxFit.cover, // Para cobrir o espaço sem distorcer
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100, color: Colors.grey), // Imagem de erro
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Text('Nome: ${character.name ?? 'N/A'}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Divider(), // Linha divisória
            _buildDetailRow('Espécie', character.species),
            _buildDetailRow('Gênero', character.gender),
            _buildDetailRow('Casa', character.house),
            _buildDetailRow('Nascimento', character.dateOfBirth),
            _buildDetailRow('Ancestralidade', character.ancestry),
            _buildDetailRow('Patronus', character.patronus),
            _buildBooleanDetailRow('Mago', character.wizard),
            _buildBooleanDetailRow('Estudante de Hogwarts', character.hogwartsStudent),
            _buildBooleanDetailRow('Membro da Staff', character.hogwartsStaff),

            // Informações da varinha, se existirem
            if (character.wand != null && (character.wand!.wood != null || character.wand!.core != null || character.wand!.length != null))
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Detalhes da Varinha:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown)),
                    const SizedBox(height: 10),
                    _buildDetailRow('Madeira', character.wand!.wood),
                    _buildDetailRow('Núcleo', character.wand!.core),
                    _buildDetailRow('Comprimento', character.wand!.length?.toString()), // Length pode ser double/int
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Helper para construir linhas de detalhes (String)
  Widget _buildDetailRow(String label, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink(); // Não mostra se vazio
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black87), // Estilo padrão
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  // Helper para construir linhas de detalhes (Boolean)
  Widget _buildBooleanDetailRow(String label, bool? value) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black87),
          children: [
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value ? 'Sim' : 'Não'),
          ],
        ),
      ),
    );
  }
}