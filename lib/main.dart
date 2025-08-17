import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(ClubSorteioApp());

class Club {
  final String nome;
  final int nivel;

  Club(this.nome, this.nivel);
}

class ClubSorteioApp extends StatelessWidget {
  const ClubSorteioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Sorteio de Clubes', home: SorteioPage());
  }
}

class SorteioPage extends StatefulWidget {
  const SorteioPage({super.key});

  @override
  State<SorteioPage> createState() => _SorteioPageState();
}

class _SorteioPageState extends State<SorteioPage> {
  final List<Club> clubes = [
    Club('Barcelona', 88),
    Club('Real Madrid', 90),
    Club('Manchester City', 91),
    Club('Juventus', 85),
    Club('PSG', 89),
    Club('Chelsea', 84),
    Club('Milan', 80),
    Club('Flamengo', 78),
    Club('Palmeiras', 77),
    Club('Atlético Mineiro', 76),
    Club('Corinthians', 74),
    Club('Botafogo', 70),
    Club('Cruzeiro', 69),
    Club('Vasco', 68),
    Club('Grêmio', 72),
    Club('Internacional', 73),
  ];

  Club? clube1;
  Club? clube2;

  void sortearClubes() {
    final random = Random();
    final candidatos = clubes
        .where((c) => c.nivel >= 65 && c.nivel <= 99)
        .toList();

    candidatos.shuffle();

    for (int i = 0; i < candidatos.length - 1; i++) {
      final diff = (candidatos[i].nivel - candidatos[i + 1].nivel).abs();
      if (diff <= 2) {
        setState(() {
          clube1 = candidatos[i];
          clube2 = candidatos[i + 1];
        });
        return;
      }
    }

    // Se não encontrar parelhos, sorteia aleatoriamente
    setState(() {
      clube1 = candidatos[random.nextInt(candidatos.length)];
      clube2 = candidatos[random.nextInt(candidatos.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sorteio de Clubes')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (clube1 != null && clube2 != null) ...[
              Text('🔵 ${clube1!.nome} (${clube1!.nivel})'),
              SizedBox(height: 10),
              Text('🔴 ${clube2!.nome} (${clube2!.nivel})'),
              SizedBox(height: 20),
            ],
            ElevatedButton(
              onPressed: sortearClubes,
              child: Text('Sortear Clubes'),
            ),
          ],
        ),
      ),
    );
  }
}
