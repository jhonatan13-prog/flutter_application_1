import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(ClubSorteioApp());

class Club {
  final String nome;
  final int nivel;
  final String escudoPath;

  Club(this.nome, this.nivel, this.escudoPath);
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
  bool usarIntervaloBaixo = true; // Variável para alternar o intervalo
  late final List<Club> clubes = [
    Club('FC Bayern München', 84, 'assets/images/clubes/alemanha/bayern.png'),
    Club('Bayer 04 Leverkusen', 83, 'assets/images/clubes/alemanha/leverkusen.png'),
    Club('Borussia Mönchengladbach', 76, 'assets/images/clubes/alemanha/borussiaM.png'),
    Club('SC Freiburg', 74, 'assets/images/clubes/alemanha/freiburg.png')
  ];

  Club? clube1;
  Club? clube2;

  void sortearClubes() {
    final random = Random();

    // Define o intervalo com base na variável
    final candidatos = clubes.where((c) {
      if (usarIntervaloBaixo) {
        return c.nivel >= 65 && c.nivel <= 80;
      } else {
        return c.nivel > 80 && c.nivel <= 99;
      }
    }).toList();

    candidatos.shuffle();

    for (int i = 0; i < candidatos.length - 1; i++) {
      final diff = (candidatos[i].nivel - candidatos[i + 1].nivel).abs();
      if (diff <= 2) {
        setState(() {
          clube1 = candidatos[i];
          clube2 = candidatos[i + 1];
          usarIntervaloBaixo =
              !usarIntervaloBaixo; // Alterna para o próximo sorteio
        });
        return;
      }
    }

    // Se não encontrar pares próximos, sorteia dois aleatórios
    setState(() {
      clube1 = candidatos[random.nextInt(candidatos.length)];
      clube2 = candidatos[random.nextInt(candidatos.length)];
      usarIntervaloBaixo = !usarIntervaloBaixo; // Alterna mesmo assim
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 18, 49), // Cor do AppBar
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/app/logosc.png', // Ícone ou logo
              height: 40,
            ),
            SizedBox(width: 30),
            Text(
              'Sorteia Clubs',
              style: TextStyle(
                fontFamily: 'OrbitronBlack',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ), //Cabeçalho
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/app/cenario.jpg',
            ), // Caminho da imagem
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (clube1 != null && clube2 != null) ...[
                // Clube 1 - escudo em cima, nome embaixo
                Column(
                  children: [
                    Image.asset(clube1!.escudoPath, height: 80),
                    SizedBox(height: 8),
                    Text(
                      '${clube1!.nome} (${clube1!.nivel})',
                      style: TextStyle(
                        fontFamily: 'ChampionsBold',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    // X abaixo do clube1
                    Text(
                      'X',
                      style: TextStyle(
                        fontFamily: 'ChampionsBold',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Clube 2 - escudo em cima, nome ao lado
                    Column(
                      children: [
                        Image.asset(clube2!.escudoPath, height: 80),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${clube2!.nome} (${clube2!.nivel})',
                              style: TextStyle(
                                fontFamily: 'ChampionsBold',
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
              ],
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Cor de fundo do botão
                  foregroundColor: Colors.white, // Cor do texto e ícones
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  textStyle: const TextStyle(
                    fontFamily: 'OrbitronBlack',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: sortearClubes,
                child: Text('Sortear Clubes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
