
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
      home: const TelaCatalogo(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;

  const PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
  });
}

class TelaCatalogo extends StatelessWidget {
  const TelaCatalogo({super.key});

  static const List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Orla de Santos',
      cidade: 'Santos',
      descricao: 'Jardins e ciclovia a beira-mar.',
    ),
    PontoTuristico(
      nome: 'Aquario Municipal',
      cidade: 'Santos',
      descricao: 'Atracao dedicada a vida marinha.',
    ),
    PontoTuristico(
      nome: 'Museu do Cafe',
      cidade: 'Santos',
      descricao: 'Museu sobre a historia do cafe.',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'Sao Vicente',
      descricao: 'Local conhecido por seus mirantes.',
    ),
    PontoTuristico(
      nome: 'Morro do Maluf',
      cidade: 'Guaruja',
      descricao: 'Vista para a Praia da Enseada.',
    ),
    PontoTuristico(
      nome: 'Praia do Cibratel',
      cidade: 'Itanhaem',
      descricao: 'Praia para passeios e lazer.',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongagua',
      descricao: 'Local tradicional para pesca.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lucas Viana dos Santos'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: pontos.length,
        itemBuilder: (context, index) {
          final ponto = pontos[index];

          return ListTile(
            title: Text(ponto.nome),
            subtitle: Text(
              '${ponto.cidade}\n${ponto.descricao}',
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}
