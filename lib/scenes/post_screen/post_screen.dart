import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  static const String routeName = '/post'; // Nome da rota
  final dynamic post; // Para receber os dados do post

  const PostScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Post'),
      ),
      body: Center(
        child: Text('Detalhes do Post: ${post.toString()}'), // Exibe os dados do post
      ),
    );
  }
}