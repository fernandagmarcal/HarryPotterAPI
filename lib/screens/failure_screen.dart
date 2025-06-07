import 'package:flutter/material.dart';

class FailureScreen extends StatelessWidget {
  final String message;

  const FailureScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Erro!')),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 15, color: Colors.red),
        ),
      ),
    );
  }
}
