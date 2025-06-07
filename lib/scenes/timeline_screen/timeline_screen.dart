import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  static const String routeName = '/timeline'; // Nome da rota
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timeline'),
      ),
      body: Center(
        child: const Text('Conteúdo da Timeline'),
      ),
    );
  }
}