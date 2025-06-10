import 'package:flutter/material.dart';
import 'package:rm_api/models/character.dart';
import 'package:rm_api/ui/app_colors.dart';

class PostScreen extends StatelessWidget {
  static const String routeName = '/post';
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic args = ModalRoute.of(context)?.settings.arguments;
    final Character? character = args is Character ? args : null;

    if (character == null) {
      return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Erro: Detalhes do Personagem',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,),),
          centerTitle: true,
          backgroundColor: AppColors.azulEscuro,
          foregroundColor: Colors.white,
          elevation: 4,
          automaticallyImplyLeading: false,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.sentiment_dissatisfied,
                size: 100,
                color: Colors.red[700],),
              const SizedBox(height: 16),
              Text(
                'Nenhum personagem selecionado ou dados inválidos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.red[800]),),],),),);
    }

    // detalhes do personagem
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.azulEscuro,
        elevation: 4,
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);},),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.person, color: AppColors.marromClaro),
            const SizedBox(width: 8),
            Text(
              'Detalhes de ${character.name ?? 'Personagem'}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,),),],),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do Personagem (com Hero animation e loading/error builders)
            if (character.image != null && character.image!.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Hero( // <<< Widget Hero para animação de transição
                    tag: 'character_image_${character.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        character.image!,
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width * 0.6,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                  : null,
                              color: AppColors.marromClaro,),);},
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, size: 100, color: AppColors.marromClaro),),),),),),

            const SizedBox(height: 10),
            Text(
              '💫 Detalhes de ${character.name ?? 'Personagem'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.marromClaro),
            ),
            Divider(color: AppColors.marromClaro, thickness: 1.5, height: 30), // Linha divisória temática

            // Detalhes principais do personagem usando helper com ícones
            _buildDetailRow('Espécie', character.species, Icons.psychology),
            _buildDetailRow('Gênero', character.gender, Icons.person_outline),
            _buildDetailRow('Casa', character.house, Icons.castle),
            _buildDetailRow('Nascimento', character.dateOfBirth, Icons.cake),
            _buildDetailRow('Ancestralidade', character.ancestry, Icons.family_restroom),
            _buildDetailRow('Patronus', character.patronus, Icons.flare_sharp),
            _buildBooleanDetailRow('Mago', character.wizard, Icons.auto_awesome),
            _buildBooleanDetailRow('Estudante de Hogwarts', character.hogwartsStudent, Icons.school),
            _buildBooleanDetailRow('Membro da Staff', character.hogwartsStaff, Icons.work),

            // Informações da varinha, se existirem
            if (character.wand != null && (character.wand!.wood != null || character.wand!.core != null || character.wand!.length != null))
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🪄 Detalhes da Varinha:',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.marromClaro),
                    ),
                    Divider(color: AppColors.marromClaro, thickness: 1, height: 20),
                    _buildDetailRow('Madeira', character.wand!.wood, Icons.nature),
                    _buildDetailRow('Núcleo', character.wand!.core, Icons.star_border),
                    _buildDetailRow('Comprimento', character.wand!.length?.toString(), Icons.straighten),],),),],),
      ),
    );
  }

  // Helper para construir linhas de detalhes (String) com ícone
  Widget _buildDetailRow(String label, String? value, IconData icon) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.marromClaro), // Ícone
          const SizedBox(width: 10), // Espaço
          Expanded( // Para que o texto não ultrapasse a largura
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: AppColors.brancoPadrao), // Cor do texto
                children: [
                  TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: value),],),),),],),);
  }

  // Helper para construir linhas de detalhes (Boolean) com ícone
  Widget _buildBooleanDetailRow(String label, bool? value, IconData icon) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.marromClaro), // Ícone
          const SizedBox(width: 10), // Espaço
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 20, color: AppColors.brancoPadrao),
              children: [
                TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value ? 'Sim' : 'Não'),],),),],),);
  }
}