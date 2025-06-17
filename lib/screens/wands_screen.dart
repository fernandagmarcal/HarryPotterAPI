import 'package:flutter/material.dart';
import 'package:hp_api/widgets/telas_app_bar.dart';
import '../routes/app_routes.dart';
import '../ui/app_colors.dart';

class WandsScreen extends StatelessWidget {
  static const String routeName = AppRoutes.wands;

  const WandsScreen({super.key});

  // Container com largura máxima controlada para qualquer conteúdo interno
  Widget buildWrappedSection(Widget child) {
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: child,
      ),
    );
  }

  // Seção com título e conteúdo
  Widget buildSection({
    required String title,
    required List<Widget> content,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.brancoPadrao,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.brancoPadrao, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.marromClaro,),),
          const SizedBox(height: 8),
          ...content,],),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: TelasAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildWrappedSection(
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.flare, color: AppColors.marromClaro),
                      const SizedBox(width: 8),
                      Text(
                        'Varinhas Mágicas',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'InterRegular',
                          fontWeight: FontWeight.w800,
                          color: AppColors.marromClaro,),),],),
                  const SizedBox(height: 12),
                  Text(
                    'No mundo de Harry Potter, cada bruxo possui uma varinha única — quase como uma extensão de sua alma. Feitas com diferentes madeiras, núcleos mágicos e tamanhos, as varinhas influenciam diretamente o estilo e a força do bruxo.',
                    style: TextStyle(fontSize: 18, color: AppColors.brancoPadrao, fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,),],),),
            const SizedBox(height: 20),

            // Tipos de madeira
            buildWrappedSection(
              buildSection(
                title: '🌳 Tipos de Madeira',
                content: [
                  Text(
                    'A madeira influencia o temperamento da varinha. Exemplos:',
                    style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal, fontFamily: 'InterRegular', fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('• Azevinho — ideal para bruxos em jornadas difíceis.', style: TextStyle(fontSize: 18,  fontFamily: 'InterRegular', fontWeight: FontWeight.bold,color: AppColors.azulPrincipal)),
                  Text('• Carvalho — poderosa e leal.', style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal, fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),
                  Text('• Teixo — associada a bruxos de grande poder.', style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal, fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Núcleo mágico
            buildWrappedSection(
              buildSection(
                title: '💠 Núcleo Mágico',
                content: [
                  Text(
                    'O núcleo é o "coração" da varinha. Os mais comuns são:',
                    style: TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.azulPrincipal),),
                  const SizedBox(height: 8),
                  Text('• Pena de fênix — rara, poderosa e imprevisível.', style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal, fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),
                  Text('• Corda de coração de dragão — potente e intensa.', style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal,fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),
                  Text('• Pelo de unicórnio — leal, estável e confiável.', style: TextStyle(fontSize: 18, color: AppColors.azulPrincipal, fontFamily: 'InterRegular', fontWeight: FontWeight.bold)),],),),

            // Tamanho e flexibilidade
            buildWrappedSection(
              buildSection(
                title: '📏 Tamanho e Flexibilidade',
                content: [
                  Text(
                    'As varinhas variam entre cerca de 9 e 15 polegadas, e seu comprimento está ligado ao estilo pessoal e à presença física ou mágica do bruxo. Varinhas mais curtas tendem a funcionar bem com usuários diretos e focados, enquanto varinhas mais longas são geralmente associadas a bruxos ousados ou com propósitos grandiosos.',
                    style: TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.azulPrincipal), textAlign: TextAlign.justify,),
                  const SizedBox(height: 12),
                  Text(
                    'Apesar disso, não existe um tipo “melhor”: a combinação perfeita depende da personalidade, intenções e da conexão mágica entre bruxo e varinha.',
                    style: TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold,  color: AppColors.azulPrincipal), textAlign: TextAlign.justify,),],),),

            // Lealdade
            buildWrappedSection(
              buildSection(
                title: '📚 Lealdade da Varinha',
                content: [
                  Text(
                    '“A varinha escolhe o bruxo — e não o contrário.”',
                    style: TextStyle(fontSize: 18, fontFamily: 'InterRegular', fontWeight: FontWeight.bold, color: AppColors.azulPrincipal, fontStyle: FontStyle.italic,),),
                  Text(
                    '— Sr. Ollivander, Harry Potter e a Pedra Filosofal',
                    style: TextStyle(fontSize: 16,fontFamily: 'InterRegular', fontWeight: FontWeight.bold,  color: AppColors.azulPrincipal),),
                  const SizedBox(height: 8),
                  Text(
                    'Mesmo que você conquiste outra varinha, ela raramente funcionará tão bem se não tiver lealdade a você.',
                    style: TextStyle(fontSize: 18,fontFamily: 'InterRegular', fontWeight: FontWeight.bold,  color: AppColors.azulPrincipal), textAlign: TextAlign.justify,),],),),
            const Text(
              '✨ ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'InterRegular', fontWeight: FontWeight.bold,
                  color: AppColors.marromClaro,
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),),]),),
            const SizedBox(height: 40),
            const Text(
              'Fontes:\nharrypotter.fandom.com\nharrypotter.com',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'InterRegular', fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: AppColors.azulClaro,),),
          ],
        ),
      ),
    );
  }
}

