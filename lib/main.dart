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
    // 🇩🇪 Alemanha
    Club('FC Bayern München', 84),
    Club('Bayer 04 Leverkusen', 83),
    Club('Borussia Dortmund', 81),
    Club('RB Leipzig', 80),
    Club('Eintracht Frankfurt', 77),
    Club('VfB Stuttgart', 77),
    Club('VfL Wolfsburg', 77),
    Club('Borussia Mönchengladbach', 76),
    Club('SC Freiburg', 76),
    Club('SV Werder Bremen', 75),
    Club('FC Union Berlin', 75),
    Club('TSG 1899 Hoffenheim', 75),
    Club('FSV Mainz 05', 75),
    Club('FC Augsburg', 74),
    Club('FC Heidenheim 1846', 72),
    Club('VfL Bochum 1848', 72),
    Club('Holstein Kiel', 70),
    Club('SV Darmstadt 98', 70),
    Club('Hannover 96', 70),
    Club('FC Köln', 72),
    Club('FC St. Pauli', 72),
    Club('Hamburger SV', 71),
    Club('Fortuna Düsseldorf', 70),
    Club('Hertha BSC', 70),

    // 🇸🇦 Arábia Saudita
    Club('Al Hilal', 77),
    Club('Al Nassr', 76),
    Club('Al Ahli SFC', 75),
    Club('Al Ittihad', 74),
    Club('Al Shabab', 71),
    Club('Al Qadsiah FC', 70),
    Club('Al Taawoun FC', 70),
    Club('Al Ettifaq', 69),

    // 🇦🇷 Argentina
    Club('River Plate', 77),
    Club('Boca Juniors', 74),
    Club('Racing Club', 74),
    Club('Talleres', 73),
    Club('Estudiantes de La Plata', 73),
    Club('Lanús', 72),
    Club('Vélez Sarsfield', 72),
    Club('Independiente', 71),
    Club('Newell\'s Old Boys', 71),
    Club('Argentinos Juniors', 71),
    Club('Belgrano de Córdoba', 71),
    Club('Rosario Central', 71),
    Club('Godoy Cruz', 70),
    Club('Defensa y Justicia', 70),
    Club('Huracán', 70),
    Club('Gimnasia y Esgrima La Plata', 70),
    Club('San Lorenzo de Almagro', 70),
    Club('Central Cordoba SdE', 69),
    Club('Atlético Tucumán', 69),
    Club('Club Atlético Unión', 69),
    Club('Instituto Atlético Central Córdoba', 69),
    Club('Barracas Central', 69),

    // 🇧🇪 Bélgica
    Club('Club Brugge KV', 74),
    Club('RSC Anderlecht', 73),
    Club('KRC Genk', 72),
    Club('KAA Gent', 71),
    Club('Union Saint-Gilloise', 71),
    Club('Royal Antwerp FC', 71),

    // 🇩🇰 Dinamarca
    Club('Brøndby IF', 70),
    Club('FC Midtjylland', 70),

    // 🏴 Escócia
    Club('Celtic', 75),
    Club('Rangers FC', 74),

    // 🇪🇸 Espanha
    Club('Real Madrid', 85),
    Club('FC Barcelona', 84),
    Club('Atlético Madrid', 82),
    Club('Athletic Club', 79),
    Club('Real Betis Balompié', 78),
    Club('Real Sociedad', 78),
    Club('Villarreal CF', 78),
    Club('Girona FC', 78),
    Club('Valencia CF', 77),
    Club('CA Osasuna', 77),
    Club('Rayo Vallecano', 77),
    Club('RC Celta', 76),
    Club('RCD Mallorca', 76),
    Club('Sevilla FC', 76),
    Club('Getafe CF', 75),
    Club('UD Las Palmas', 75),
    Club('CD Leganés', 74),
    Club('RCD Espanyol', 74),
    Club('UD Almería', 73),
    Club('Real Valladolid CF', 72),
    Club('Cádiz CF', 71),
    Club('Real Oviedo', 71),
    Club('Granada CF', 71),
    Club('Levante UD', 70),
    Club('Real Sporting de Gijón', 70),
    Club('Elche CF', 70),
    Club('RC Deportivo de La Coruña', 70),

    // 🇺🇸 Estados Unidos
    Club('Inter Miami', 73),
    Club('Seattle Sounders FC', 71),
    Club('Los Angeles FC', 71),
    Club('LA Galaxy', 71),
    Club('St. Louis CITY SC', 70),
    Club('Charlotte FC', 70),
    Club('Atlanta United', 70),
    Club('FC Cincinnati', 70),
    Club('New York Red Bulls', 69),
    Club('Orlando City SC', 69),
    Club('Austin FC', 69),

    // 🇫🇷 França
    Club('Paris Saint-Germain', 83),
    Club('Olympique de Marseille', 78),
    Club('Lille OSC', 77),
    Club('Olympique Lyonnais', 77),
    Club('OGC Nice', 77),
    Club('Stade Rennais FC', 76),
    Club('Stade Brestois 29', 76),
    Club('RC Lens', 75),
    Club('FC Nantes', 74),
    Club('RC Strasbourg Alsace', 74),
    Club('Toulouse FC', 73),
    Club('AJ Auxerre', 73),
    Club('Montpellier HSC', 73),
    Club('Stade de Reims', 73),
    Club('Le Havre AC', 72),
    Club('AS Saint-Étienne', 71),
    Club('FC Lorient', 71),
    Club('Angers SCO', 71),
    Club('FC Metz', 70),
    Club('Paris FC', 70),

    // ING Inglaterra
    Club('Manchester City', 85),
    Club('Liverpool', 84),
    Club('Arsenal', 83),
    Club('Aston Villa', 81),
    Club('Newcastle United', 81),
    Club('Tottenham Hotspur', 81),
    Club('Chelsea', 80),
    Club('Manchester United', 80),
    Club('Crystal Palace', 78),
    Club('Brighton & Hove Albion', 78),
    Club('West Ham United', 78),
    Club('Brentford', 77),
    Club('Fulham FC', 77),
    Club('AFC Bournemouth', 77),
    Club('Everton', 76),
    Club('Wolverhampton Wanderers', 76),
    Club('Ipswich Town', 75),
    Club('Leicester City', 75),
    Club('Burnley', 74),
    Club('Leeds United', 74),
    Club('Southampton', 74),
    Club('Sheffield United', 73),
    Club('Middlesbrough', 72),
    Club('Sunderland', 72),
    Club('Luton Town', 72),
    Club('Coventry City', 71),
    Club('West Bromwich Albion', 71),
    Club('Hull City', 71),
    Club('Norwich City', 70),
    Club('Blackburn Rovers', 70),
    Club('Watford', 70),
    Club('Preston North End', 70),
    Club('Queens Park Rangers', 70),
    Club('Sheffield Wednesday', 70),
    Club('Birmingham City', 70),
    Club('Millwall FC', 70),
    Club('Bristol City', 70),
    Club('Stoke City', 69),

    // 🇮🇹 Itália
    Club('Inter', 84),
    Club('AC Milan', 81),
    Club('Atalanta', 80),
    Club('Juventus', 80),
    Club('Lazio', 79),
    Club('Napoli', 79),
    Club('Roma', 79),
    Club('Fiorentina', 77),
    Club('Torino', 76),
    Club('Bologna', 76),
    Club('Como', 74),
    Club('Parma', 73),
    Club('Cagliari', 73),
    Club('Udinese', 73),
    Club('Lecce', 73),
    Club('Monza', 73),
    Club('Hellas Verona FC', 73),
    Club('Genoa', 73),
    Club('Palermo FC', 72),
    Club('Sassuolo', 72),
    Club('Sampdoria', 71),
    Club('Cremonese', 71),
    Club('Venezia', 71),
    Club('Spezia', 70),

    // 🇳🇱 Holanda
    Club('PSV', 78),
    Club('Ajax', 76),
    Club('Feyenoord', 76),
    Club('FC Twente', 72),
    Club('AZ Alkmaar', 71),

    // 🇵🇹 Portugal
    Club('SL Benfica', 79),
    Club('Sporting CP', 79),
    Club('FC Porto', 76),
    Club('Sporting Clube de Braga', 74),
    Club('Vitória SC', 71),
    Club('GD Estoril Praia', 70),
    Club('FC Arouca', 70),

    // 🇹🇷 Turquia
    Club('Fenerbahçe SK', 80),
    Club('Galatasaray SK', 79),
    Club('Beşiktaş JK', 76),
    Club('Trabzonspor', 75),
    Club('Medipol Başakşehir FK', 72),
    Club('Kasımpaşa SK', 71),
    Club('Eyüpspor', 70),
    Club('Çaykur Rizespor', 70),
    Club('Samsunspor', 70),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.house, color: Colors.green, size: 24),
                  SizedBox(width: 8),
                  Text('${clube1!.nome} (${clube1!.nivel})'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flight_takeoff, color: Colors.blueGrey, size: 24),
                  SizedBox(width: 8),
                  Text('${clube2!.nome} (${clube2!.nivel})'),
                ],
              ),
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
