import 'package:flutter/material.dart';
import 'package:hp_api/models/character.dart';
import 'package:hp_api/ui/app_colors.dart';
import 'package:hp_api/widgets/telas_app_bar.dart';

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
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'InterRegular', fontSize: 20, color: Colors.white,),),
          centerTitle: true,
          backgroundColor: AppColors.azulEscuro,
          foregroundColor: Colors.white,
          elevation: 4,
          automaticallyImplyLeading: false,),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sentiment_dissatisfied, size: 100, color: Colors.red[700],),
              const SizedBox(height: 16),
              Text('Nenhum personagem selecionado ou dados inválidos.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: Colors.red[800]),),],),),);}

    // Detalhes do personagem
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const TelasAppBar(), // Usando sua AppBar customizada
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // foto do personagem
            Card(color: AppColors.brancoPadrao, elevation: 6, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Imagem do Personagem (com Hero animation e loading/error builders)
                    if (character.image != null && character.image!.isNotEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Hero(
                            tag: 'character_image_${character.id}',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                character.image!,
                                height: MediaQuery.of(context).size.height * 0.45, // Reduzi um pouco a altura para acomodar o card
                                width: MediaQuery.of(context).size.width * 0.50,
                                fit: BoxFit.cover, loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                          : null,
                                      color: AppColors.marromClaro,),);},
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.broken_image, size: 100, color: AppColors.marromClaro),),),),),),
                    Text(
                      'Conheça ${character.name ?? 'Personagem'}',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.azulPrincipal),),],),),),
            const SizedBox(height: 20), // Espaço entre os cards

            // card infos
            Card(color: AppColors.brancoPadrao, elevation: 6,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Informações Principais',
                      style: TextStyle(fontSize: 24, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.marromClaro),),
                    Divider(color: AppColors.marromClaro, thickness: 1.5, height: 30),
                    _buildDetailRow('Espécie', character.species, Icons.animation),
                    _buildDetailRow('Gênero', character.gender, Icons.person),
                    _buildDetailRow('Casa', character.house, Icons.castle),
                    _buildDetailRow('Nascimento', character.dateOfBirth, Icons.cake),
                    _buildDetailRow('Ancestralidade', character.ancestry, Icons.family_restroom),
                    _buildDetailRow('Patronus', character.patronus, Icons.flare_sharp),
                    _buildBooleanDetailRow('Mago', character.wizard, Icons.auto_awesome),
                    _buildBooleanDetailRow('Estudante de Hogwarts', character.hogwartsStudent, Icons.school),
                    _buildBooleanDetailRow('Membro da Staff', character.hogwartsStaff, Icons.stars),],),),),
            const SizedBox(height: 20),

            // card varinha
            if (character.wand != null && (character.wand!.wood != null || character.wand!.core != null || character.wand!.length != null))
              Card(color: AppColors.brancoPadrao, elevation: 6, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Detalhes da Varinha Mágica',
                        style: TextStyle(fontSize: 24, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.marromClaro),),
                      Divider(color: AppColors.marromClaro, thickness: 1, height: 20),
                      _buildDetailRow('Madeira', character.wand!.wood, Icons.park),
                      _buildDetailRow('Núcleo', character.wand!.core, Icons.center_focus_strong),
                      _buildDetailRow('Comprimento', character.wand!.length?.toString(), Icons.straighten),],),),),
            const SizedBox(height: 20),],),),);
  }

  // Helper para construir linhas de detalhes (String) com ícone
  Widget _buildDetailRow(String label, String? value, IconData icon) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.marromClaro),
          const SizedBox(width: 10), // Espaço
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 20, color: AppColors.azulPrincipal),
                children: [
                  TextSpan(text: '$label: ', style: const TextStyle(fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),
                  TextSpan(text: value),],),),),],),);}

  // Helper para construir linhas de detalhes (Boolean) com ícone
  Widget _buildBooleanDetailRow(String label, bool? value, IconData icon) {
    if (value == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.marromClaro),
          const SizedBox(width: 10),
          RichText(
            text: TextSpan(style: TextStyle(fontSize: 20, fontFamily: 'InterRegular', color: AppColors.azulPrincipal),
              children: [
                TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value ? 'Sim' : 'Não'),],),),],),);
  }
}