
import 'package:flutter/material.dart';

// Aluno: Lucas Viana dos Santos
// TP4 - Catalogo de pontos turisticos da Baixada Santista

void main() {
  runApp(const TurismoApp());
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

class TurismoApp extends StatelessWidget {
  const TurismoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo na Baixada Santista',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const TelaTurismo(),
    );
  }
}

class TelaTurismo extends StatefulWidget {
  const TelaTurismo({super.key});

  @override
  State<TelaTurismo> createState() => _TelaTurismoState();
}

class _TelaTurismoState extends State<TelaTurismo> {
  final List<PontoTuristico> pontos = [
    PontoTuristico(
      nome: 'Orla de Santos',
      cidade: 'Santos',
      descricao: 'Jardins a beira-mar e ciclovia.',
      imagem: 'assets/images/orla_santos.jpg',
    ),
    PontoTuristico(
      nome: 'Aquario Municipal',
      cidade: 'Santos',
      descricao: 'Atracao tradicional com especies marinhas.',
      imagem: 'assets/images/aquario_santos.jpg',
    ),
    PontoTuristico(
      nome: 'Museu do Cafe',
      cidade: 'Santos',
      descricao: 'Historia do cafe em um edificio historico.',
      imagem: 'assets/images/museu_cafe.jpg',
    ),
    PontoTuristico(
      nome: 'Ilha Porchat',
      cidade: 'Sao Vicente',
      descricao: 'Vista panoramica da regiao costeira.',
      imagem: 'assets/images/ilha_porchat.jpg',
    ),
    PontoTuristico(
      nome: 'Morro do Maluf',
      cidade: 'Guaruja',
      descricao: 'Mirante com vista para o mar e as praias.',
      imagem: 'assets/images/morro_maluf.jpg',
    ),
    PontoTuristico(
      nome: 'Praia do Gonzaga',
      cidade: 'Santos',
      descricao: 'Praia movimentada com comercios e lazer.',
      imagem: 'assets/images/praia_gonzaga.jpg',
    ),
    PontoTuristico(
      nome: 'Plataforma de Pesca',
      cidade: 'Mongagua',
      descricao: 'Estrutura conhecida para pesca e passeio.',
      imagem: 'assets/images/plataforma_mongagua.jpg',
    ),
    PontoTuristico(
  nome: 'Morro do Cibratel',
  cidade: 'Itanhaem',
  descricao: 'Local para apreciar a paisagem do litoral.',
  imagem: 'assets/images/morro_cibratel.jpg',
),
PontoTuristico(
  nome: 'Mirante das Galhetas',
  cidade: 'Guaruja',
  descricao: 'Mirante com vista panoramica do mar, das praias e das rochas do litoral.',
  imagem: 'assets/images/mirante_galhetas.webp',
),
  ];

  int get totalFavoritos =>
      pontos.where((ponto) => ponto.favorito).length;

  int get totalVisitados =>
      pontos.where((ponto) => ponto.visitado).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lucas Viana dos Santos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text('Favoritos: $totalFavoritos'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text('Visitados: $totalVisitados'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(120, 12, 120, 12),
              itemCount: pontos.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) {
                return criarCard(pontos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget criarCard(PontoTuristico ponto) {
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              ponto.imagem,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 35,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(7, 6, 7, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ponto.nome,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 13,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        ponto.cidade,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Text(
                  ponto.descricao,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Favorito',
                      style: TextStyle(fontSize: 9),
                    ),
                    value: ponto.favorito,
                    activeColor: Colors.red,
                    onChanged: (valor) {
                      setState(() {
                        ponto.favorito = valor ?? false;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      'Visitado',
                      style: TextStyle(fontSize: 9),
                    ),
                    value: ponto.visitado,
                    activeColor: Colors.green,
                    onChanged: (valor) {
                      setState(() {
                        ponto.visitado = valor ?? false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
