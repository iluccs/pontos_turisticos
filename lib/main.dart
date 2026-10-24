import 'package:flutter/material.dart';

// Aluno: Lucas Viana dos Santos
// TP4 - Catalogo de Pontos Turisticos

void main() {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo na Baixada Santista',
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lucas Viana dos Santos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Catalogo de Pontos Turisticos',
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}