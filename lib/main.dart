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
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const TelaCatalogo(),
    );
  }
}

class PontoTuristico {
  final String nome;
  final String cidade;
  final String descricao;
  final String imagem;
  bool favorito;
  bool visitado;

  PontoTuristico({
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.imagem,
    this.favorito = false,
    this.visitado = false,
  });
}

class TelaCatalogo extends StatefulWidget {
  const TelaCatalogo({super.key});

  @override
  State<TelaCatalogo> createState() => _TelaCatalogoState();
}

class _TelaCatalogoState extends State<TelaCatalogo> {
  final List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Orla de Santos',
      cidade: 'Santos',
      descricao: 'Jardins, ciclovia e paisagem a beira-mar.',
      imagem: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    ),
    PontoTuristico(
      nome: 'Aquario Municipal',
      cidade: 'Santos',
      descricao: 'Atracao dedicada a vida marinha.',
      imagem: 'https://images.unsplash.com/photo-1545670723-196ed0954986',
    ),
    PontoTuristico(
      nome: 'Museu do Cafe',
      cidade: 'Santos',
      descricao: 'Museu sobre a historia do cafe.',
      imagem: 'https://images.unsplash.com/photo-1445116572660-236099ec97a0',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'Sao Vicente',
      descricao: 'Local conhecido por seus mirantes.',
      imagem: 'https://images.unsplash.com/photo-1519046904884-53103b34b206',
    ),
    PontoTuristico(
      nome: 'Morro do Maluf',
      cidade: 'Guaruja',
      descricao: 'Mirantes com vista para a Praia da Enseada.',
      imagem: 'https://images.unsplash.com/photo-1500375592092-40eb2168fd21',
    ),
    PontoTuristico(
      nome: 'Praia do Cibratel',
      cidade: 'Itanhaem',
      descricao: 'Praia para passeios e lazer.',
      imagem: 'https://images.unsplash.com/photo-1473116763249-2faaef81ccda',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongagua',
      descricao: 'Local tradicional para pesca e contemplacao do mar.',
      imagem: 'https://images.unsplash.com/photo-1509233725247-49e657c54213',
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
        padding: const EdgeInsets.all(12),
        itemCount: pontos.length,
        itemBuilder: (context, index) {
          return criarCard(pontos[index]);
        },
      ),
    );
  }

  Widget criarCard(PontoTuristico ponto) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            ponto.imagem,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, erro, stackTrace) {
              return Container(
                height: 180,
                color: Colors.blueGrey.shade100,
                child: const Center(
                  child: Icon(Icons.image_not_supported, size: 40),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ponto.nome,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(ponto.cidade),
                const SizedBox(height: 8),
                Text(ponto.descricao),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text('Favorito'),
                        value: ponto.favorito,
                        onChanged: (valor) {
                          setState(() {
                            ponto.favorito = valor ?? false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: const Text('Visitado'),
                        value: ponto.visitado,
                        onChanged: (valor) {
                          setState(() {
                            ponto.visitado = valor ?? false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}