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
    return MaterialApp(title: 'Sorteia Clubs', home: SorteioPage());
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
    // Alemanha
    Club('FC Bayern München', 84, 'assets/images/clubes/alemanha/bayern.png'),
    Club('Bayer 04 Leverkusen', 83, 'assets/images/clubes/alemanha/leverkusen.png'),
    Club('Borussia Dortmund', 81, 'assets/images/clubes/alemanha/borussia.png'),
    Club('RB Leipzig', 80, 'assets/images/clubes/alemanha/leipzig.png'),
    Club('Eintracht Frankfurt', 77, 'assets/images/clubes/alemanha/frankfurt.png'),
    Club('VfB Stuttgart', 77, 'assets/images/clubes/alemanha/stuttgart.png'),
    Club('VfL Wolfsburg', 77, 'assets/images/clubes/alemanha/wolfsburg.png'),
    Club('Borussia Mönchengladbach', 76, 'assets/images/clubes/alemanha/borussiaM.png'),
    Club('SC Freiburg', 76, 'assets/images/clubes/alemanha/freiburg.png'),
    Club('SV Werder Bremen', 75, 'assets/images/clubes/alemanha/werder.png'),
    Club('FC Union Berlin', 75, 'assets/images/clubes/alemanha/union.png'),
    Club('TSG 1899 Hoffenheim', 75, 'assets/images/clubes/alemanha/hoffenheim.png'),
    Club('FSV Mainz 05', 75, 'assets/images/clubes/alemanha/mainz.png'),
    Club('FC Augsburg', 74, 'assets/images/clubes/alemanha/augsburg.png'),
    Club('FC Heidenheim 1846', 72, 'assets/images/clubes/alemanha/heidenheim.png'),
    Club('VfL Bochum 1848', 72, 'assets/images/clubes/alemanha/bochum.png'),
    Club('Holstein Kiel', 70, 'assets/images/clubes/alemanha/kiel.png'),
    Club('SV Darmstadt 98', 70, 'assets/images/clubes/alemanha/darmstadt.png'),
    Club('Hannover 96', 70, 'assets/images/clubes/alemanha/hannover.png'),
    Club('FC Köln', 72, 'assets/images/clubes/alemanha/koln.png'),
    Club('FC St. Pauli', 72, 'assets/images/clubes/alemanha/pauli.png'),
    Club('Hamburger SV', 71, 'assets/images/clubes/alemanha/hamburger.png'),
    Club('Fortuna Düsseldorf', 70, 'assets/images/clubes/alemanha/dusseldorf.png'),
    Club('Hertha BSC', 70, 'assets/images/clubes/alemanha/hertha.png'),

    // Arabia
    Club('Al Hilal', 77, 'assets/images/clubes/arabia/hilal.png'),
    Club('Al Nassr', 76, 'assets/images/clubes/arabia/nassr.png'),
    Club('Al Ahli SFC', 75, 'assets/images/clubes/arabia/ahli.png'),
    Club('Al Ittihad', 74, 'assets/images/clubes/arabia/ittihad.png'),
    Club('Al Shabab', 71, 'assets/images/clubes/arabia/shabab.png'),
    Club('Al Qadsiah FC', 70, 'assets/images/clubes/arabia/qadsiah.png'),
    Club('Al Taawoun FC', 70, 'assets/images/clubes/arabia/taawoun.png'),
    Club('Al Ettifaq', 69, 'assets/images/clubes/arabia/ettifaq.png'),
    Club('Al Riyadh', 68, 'assets/images/clubes/arabia/riyadh.png'),

    // Argentina
    Club('River Plate', 77, 'assets/images/clubes/argentina/river.png'),
    Club('Boca Juniors', 74, 'assets/images/clubes/argentina/boca.png'),
    Club('Racing Club', 74, 'assets/images/clubes/argentina/racing.png'),
    Club('Talleres', 73, 'assets/images/clubes/argentina/talleres.png'),
    Club('Estudiantes de La Plata', 73, 'assets/images/clubes/argentina/estudiantes.png'),
    Club('Lanús', 72, 'assets/images/clubes/argentina/lanus.png'),
    Club('Vélez Sarsfield', 72, 'assets/images/clubes/argentina/velez.png'),
    Club('Independiente', 71, 'assets/images/clubes/argentina/independiente.png'),
    Club('Newell\'s Old Boys', 71, 'assets/images/clubes/argentina/newells.png'),
    Club('Argentinos Juniors', 71, 'assets/images/clubes/argentina/argentinos.png'),
    Club('Belgrano de Córdoba', 71, 'assets/images/clubes/argentina/belgrano.png'),
    Club('Rosario Central', 71, 'assets/images/clubes/argentina/rosario.png'),
    Club('Godoy Cruz', 70, 'assets/images/clubes/argentina/godoy.png'),
    Club('Defensa y Justicia', 70, 'assets/images/clubes/argentina/defensa.png'),
    Club('Huracán', 70, 'assets/images/clubes/argentina/huracan.png'),
    Club('Gimnasia y Esgrima La Plata', 70, 'assets/images/clubes/argentina/gimnasia.png'),
    Club('San Lorenzo de Almagro', 70, 'assets/images/clubes/argentina/sanlorenzo.png'),
    Club('Central Cordoba SdE', 69, 'assets/images/clubes/argentina/central.png'),
    Club('Atlético Tucumán', 69, 'assets/images/clubes/argentina/tucuman.png'),
    Club('Club Atlético Unión', 69, 'assets/images/clubes/argentina/union.png'),
    Club('Instituto Atlético Central Córdoba', 69, 'assets/images/clubes/argentina/instituto.png'),
    Club('Barracas Central', 69, 'assets/images/clubes/argentina/barracas.png'),

    // Belgica
    Club('Club Brugge KV', 74, 'assets/images/clubes/belgica/brugge.png'),
    Club('RSC Anderlecht', 73, 'assets/images/clubes/belgica/anderlecht.png'),
    Club('KRC Genk', 72, 'assets/images/clubes/belgica/genk.png'),
    Club('KAA Gent', 71, 'assets/images/clubes/belgica/gent.png'),
    Club('Union Saint-Gilloise', 71, 'assets/images/clubes/belgica/gilloise.png'),
    Club('Royal Antwerp FC', 71, 'assets/images/clubes/belgica/antwerp.png'),

    // Dinamarca
    Club('Brøndby IF', 70, 'assets/images/clubes/dinamarca/brodby.png'),
    Club('FC Midtjylland', 70, 'assets/images/clubes/dinamarca/midtjylland.png'),
    Club('FC København', 72, 'assets/images/clubes/dinamarca/kobenhavn.png'),

    // Escocia
    Club('celtic', 75, 'assets/images/clubes/escocia/celtic.png'),
    Club('Rangers FC', 74, 'assets/images/clubes/escocia/rangers.png'),

    // Espanha
    Club('Real Madrid', 85, 'assets/images/clubes/espanha/real.png'),
    Club('FC Barcelona', 84, 'assets/images/clubes/espanha/barcelona.png'),
    Club('Atlético Madrid', 82, 'assets/images/clubes/espanha/atletico.png'),
    Club('Athletic Club', 79, 'assets/images/clubes/espanha/bilbao.png'),
    Club('Real Betis Balompié', 78, 'assets/images/clubes/espanha/betis.png'),
    Club('Real Sociedad', 78, 'assets/images/clubes/espanha/sociedad.png'),
    Club('Villarreal CF', 78, 'assets/images/clubes/espanha/villareal.png'),
    Club('Girona FC', 78, 'assets/images/clubes/espanha/girona.png'),
    Club('Valencia CF', 77, 'assets/images/clubes/espanha/valencia.png'),
    Club('CA Osasuna', 77, 'assets/images/clubes/espanha/osasuna.png'),
    Club('Rayo Vallecano', 77, 'assets/images/clubes/espanha/vallecano.png'),
    Club('RC Celta', 76, 'assets/images/clubes/espanha/vigo.png'),
    Club('RCD Mallorca', 76, 'assets/images/clubes/espanha/mallorca.png'),
    Club('Sevilla FC', 76, 'assets/images/clubes/espanha/sevilla.png'),
    Club('Getafe CF', 75, 'assets/images/clubes/espanha/getafe.png'),
    Club('UD Las Palmas', 75, 'assets/images/clubes/espanha/palmas.png'),
    Club('CD Leganés', 74, 'assets/images/clubes/espanha/leganes.png'),
    Club('RCD Espanyol', 74, 'assets/images/clubes/espanha/espanyol.png'),
    Club('UD Almería', 73, 'assets/images/clubes/espanha/almeria.png'),
    Club('Real Valladolid CF', 72, 'assets/images/clubes/espanha/valladolid.png'),
    Club('Cádiz CF', 71, 'assets/images/clubes/espanha/cadiz.png'),
    Club('Real Oviedo', 71, 'assets/images/clubes/espanha/oviedo.png'),
    Club('Granada CF', 71, 'assets/images/clubes/espanha/granada.png'),
    Club('Levante UD', 70, 'assets/images/clubes/espanha/levante.png'),
    Club('Real Sporting de Gijón', 70, 'assets/images/clubes/espanha/gijon.png'),
    Club('Elche CF', 70, 'assets/images/clubes/espanha/elche.png'),
    Club('RC Deportivo de La Coruña', 70, 'assets/images/clubes/espanha/coruna.png'),

    // EUA
    Club('Inter Miami', 73, 'assets/images/clubes/eua/inter.png'),
    Club('Seattle Sounders FC', 71, 'assets/images/clubes/eua/seattle.png'),
    Club('Los Angeles FC', 71, 'assets/images/clubes/eua/lafc.png'),
    Club('LA Galaxy', 71, 'assets/images/clubes/eua/lagalaxy.png'),
    Club('St. Louis CITY SC', 70, 'assets/images/clubes/eua/louis.png'),
    Club('Charlotte FC', 70, 'assets/images/clubes/eua/charlotte.png'),
    Club('Atlanta United', 70, 'assets/images/clubes/eua/atlanta.png'),
    Club('FC Cincinnati', 70, 'assets/images/clubes/eua/cincinnati.png'),
    Club('New York Red Bulls', 69, 'assets/images/clubes/eua/nyredbulls.png'),
    Club('Orlando City SC', 69, 'assets/images/clubes/eua/orlando.png'),
    Club('Austin FC', 69, 'assets/images/clubes/eua/austin.png'),

    // França
    Club('Paris Saint-Germain', 83, 'assets/images/clubes/franca/psg.png'),
    Club('Olympique de Marseille', 78, 'assets/images/clubes/franca/marseille.png'),
    Club('Lille OSC', 77, 'assets/images/clubes/franca/lille.png'),
    Club('Olympique Lyonnais', 77, 'assets/images/clubes/franca/lyon.png'),
    Club('OGC Nice', 77, 'assets/images/clubes/franca/nice.png'),
    Club('Stade Rennais FC', 76, 'assets/images/clubes/franca/rennais.png'),
    Club('Stade Brestois 29', 76, 'assets/images/clubes/franca/brestois.png'),
    Club('RC Lens', 75, 'assets/images/clubes/franca/lens.png'),
    Club('FC Nantes', 74, 'assets/images/clubes/franca/nantes.png'),
    Club('RC Strasbourg Alsace', 74, 'assets/images/clubes/franca/strasbourg.png'),
    Club('Toulouse FC', 73, 'assets/images/clubes/franca/toulouse.png'),
    Club('AJ Auxerre', 73, 'assets/images/clubes/franca/auxerre.png'),
    Club('Montpellier HSC', 73, 'assets/images/clubes/franca/montpellier.png'),
    Club('Stade de Reims', 73, 'assets/images/clubes/franca/reims.png'),
    Club('Le Havre AC', 72, 'assets/images/clubes/franca/havre.png'),
    Club('AS Saint-Étienne', 71, 'assets/images/clubes/franca/etienne.png'),
    Club('FC Lorient', 71, 'assets/images/clubes/franca/lorient.png'),
    Club('Angers SCO', 71, 'assets/images/clubes/franca/agers.png'),
    Club('FC Metz', 70, 'assets/images/clubes/franca/metz.png'),
    Club('Paris FC', 70, 'assets/images/clubes/franca/paris.png'),

    // Inglaterra
    Club('Manchester City', 85, 'assets/images/clubes/inglaterra/city.png'),
    Club('Liverpool', 84, 'assets/images/clubes/inglaterra/liverpool.png'),
    Club('Arsenal', 83, 'assets/images/clubes/inglaterra/arsenal.png'),
    Club('Aston Villa', 81, 'assets/images/clubes/inglaterra/aston.png'),
    Club('Newcastle United', 81, 'assets/images/clubes/inglaterra/newcastle.png'),
    Club('Spurs', 81, 'assets/images/clubes/inglaterra/spurs.png'),
    Club('Chelsea', 80, 'assets/images/clubes/inglaterra/chelsea.png'),
    Club('Manchester United', 80, 'assets/images/clubes/inglaterra/man.png'),
    Club('Crystal Palace', 78, 'assets/images/clubes/inglaterra/palace.png'),
    Club('Brighton & Hove Albion', 78, 'assets/images/clubes/inglaterra/brighton.png'),
    Club('West Ham United', 78, 'assets/images/clubes/inglaterra/westham.png'),
    Club('Brentford', 77, 'assets/images/clubes/inglaterra/brentford.png'),
    Club('Fulham FC', 77, 'assets/images/clubes/inglaterra/fulham.png'),
    Club('AFC Bournemouth', 77, 'assets/images/clubes/inglaterra/bourne.png'),
    Club('Everton', 76, 'assets/images/clubes/inglaterra/everton.png'),
    Club('Wolverhampton Wanderers', 76, 'assets/images/clubes/inglaterra/wolves.png'),
    Club('Ipswich Town', 75, 'assets/images/clubes/inglaterra/ipswich.png'),
    Club('Leicester City', 75, 'assets/images/clubes/inglaterra/leicester.png'),
    Club('Burnley', 74, 'assets/images/clubes/inglaterra/burnley.png'),
    Club('Leeds United', 74, 'assets/images/clubes/inglaterra/leeds.png'),
    Club('Southampton', 74, 'assets/images/clubes/inglaterra/southampton.png'),
    Club('Sheffield United', 73, 'assets/images/clubes/inglaterra/sheffield.png'),
    Club('Middlesbrough', 72, 'assets/images/clubes/inglaterra/middles.png'),
    Club('Sunderland', 72, 'assets/images/clubes/inglaterra/sunderland.png'),
    Club('Luton Town', 72, 'assets/images/clubes/inglaterra/luton.png'),
    Club('Coventry City', 71, 'assets/images/clubes/inglaterra/coventry.png'),
    Club('West Bromwich Albion', 71, 'assets/images/clubes/inglaterra/westbrom.png'),
    Club('Hull City', 71, 'assets/images/clubes/inglaterra/hull.png'),
    Club('Norwich City', 70, 'assets/images/clubes/inglaterra/norwich.png'),
    Club('Blackburn Rovers', 70, 'assets/images/clubes/inglaterra/blackburn.png'),
    Club('Watford', 70, 'assets/images/clubes/inglaterra/watford.png'),
    Club('Preston North End', 70, 'assets/images/clubes/inglaterra/preston.png'),
    Club('Queens Park Rangers', 70, 'assets/images/clubes/inglaterra/queens.png'),
    Club('Sheffield Wednesday', 70, 'assets/images/clubes/inglaterra/sheffieldwed.png'),
    Club('Birmingham City', 70, 'assets/images/clubes/inglaterra/birmingham.png'),
    Club('Millwall FC', 70, 'assets/images/clubes/inglaterra/millwall.png'),
    Club('Bristol City', 70, 'assets/images/clubes/inglaterra/bristol.png'),
    Club('Cardiff', 70, 'assets/images/clubes/inglaterra/cardiff.png'),
    Club('Swansea', 69, 'assets/images/clubes/inglaterra/swansea.png'),
    Club('Stoke City', 69, 'assets/images/clubes/inglaterra/stoke.png'),

    //Italia
    Club('Inter', 84, 'assets/images/clubes/italia/inter.png'),
    Club('AC Milan', 81, 'assets/images/clubes/italia/milan.png'),
    Club('Atalanta', 80, 'assets/images/clubes/italia/atalanta.png'),
    Club('Juventus', 80, 'assets/images/clubes/italia/juventus.png'),
    Club('Lazio', 79, 'assets/images/clubes/italia/lazio.png'),
    Club('Napoli', 79, 'assets/images/clubes/italia/napoli.png'),
    Club('Roma', 79, 'assets/images/clubes/italia/roma.png'),
    Club('Fiorentina', 77, 'assets/images/clubes/italia/fiore.png'),
    Club('Torino', 76, 'assets/images/clubes/italia/torino.png'),
    Club('Bologna', 76, 'assets/images/clubes/italia/bologna.png'),
    Club('Como', 74, 'assets/images/clubes/italia/como.png'),
    Club('Parma', 73, 'assets/images/clubes/italia/parma.png'),
    Club('Cagliari', 73, 'assets/images/clubes/italia/cagliari.png'),
    Club('Udinese', 73, 'assets/images/clubes/italia/udinese.png'),
    Club('Lecce', 73, 'assets/images/clubes/italia/lecce.png'),
    Club('Monza', 73, 'assets/images/clubes/italia/monza.png'),
    Club('Hellas Verona FC', 73, 'assets/images/clubes/italia/verona.png'),
    Club('Genoa', 73, 'assets/images/clubes/italia/genoa.png'),
    Club('Palermo FC', 72, 'assets/images/clubes/italia/palermo.png'),
    Club('Sassuolo', 72, 'assets/images/clubes/italia/sassuolo.png'),
    Club('Sampdoria', 71, 'assets/images/clubes/italia/sampdoria.png'),
    Club('Cremonese', 71, 'assets/images/clubes/italia/cremonese.png'),
    Club('Venezia', 71, 'assets/images/clubes/italia/venezia.png'),
    Club('Spezia', 70, 'assets/images/clubes/italia/spezia.png'),
    Club('Salernitana', 69, 'assets/images/clubes/italia/salernitana.png'),
    Club('Pisa', 69, 'assets/images/clubes/italia/pisa.png'),
    Club('Modena', 69, 'assets/images/clubes/italia/modena.png'),

    //Holanda
    Club('PSV', 78, 'assets/images/clubes/holanda/psv.png'),
    Club('Ajax', 76, 'assets/images/clubes/holanda/ajax.png'),
    Club('Feyenoord', 76, 'assets/images/clubes/holanda/feyenoord.png'),
    Club('FC Twente', 72, 'assets/images/clubes/holanda/twente.png'),
    Club('AZ Alkmaar', 71, 'assets/images/clubes/holanda/az.png'),
    Club('Nec Nijmegen', 69, 'assets/images/clubes/holanda/nec.png'),

    // Portugal
    Club('SL Benfica', 79, 'assets/images/clubes/portugal/benfica.png'),
    Club('Sporting CP', 79, 'assets/images/clubes/portugal/sporting.png'),
    Club('FC Porto', 76, 'assets/images/clubes/portugal/porto.png'),
    Club('Sporting Clube de Braga', 74, 'assets/images/clubes/portugal/braga.png'),
    Club('Vitória SC', 71, 'assets/images/clubes/portugal/vitoria.png'),
    Club('GD Estoril Praia', 70, 'assets/images/clubes/portugal/estoril.png'),
    Club('FC Arouca', 70, 'assets/images/clubes/portugal/arouca.png'),
    Club('Casa Pia', 69, 'assets/images/clubes/portugal/casapia.png'),
    Club('Gil Vicente', 69, 'assets/images/clubes/portugal/gilvicente.png'),
    Club('Boa Vista', 69, 'assets/images/clubes/portugal/boavista.png'),
    Club('Moreirense', 69, 'assets/images/clubes/portugal/moreirense.png'),
    Club('AVS Futebol SAD', 69, 'assets/images/clubes/portugal/avs.png'),
    Club('Santa Clara', 69, 'assets/images/clubes/portugal/santaclara.png'),
    Club('Famalicão', 69, 'assets/images/clubes/portugal/famalicao.png'),
    Club('Rio Ave', 69, 'assets/images/clubes/portugal/rioave.png'),
    Club('Farense', 69, 'assets/images/clubes/portugal/farense.png'),

    // Turquia
    Club('Fenerbahçe SK', 80, 'assets/images/clubes/Turquia/fenerbahce.png'),
    Club('Galatasaray SK', 79, 'assets/images/clubes/Turquia/galatasaray.png'),
    Club('Beşiktaş JK', 76, 'assets/images/clubes/Turquia/besiktas.png'),
    Club('Trabzonspor', 75, 'assets/images/clubes/Turquia/trabzonspor.png'),
    Club('Medipol Başakşehir FK', 72, 'assets/images/clubes/Turquia/medipol.png'),
    Club('Kasimpaşa SK', 71, 'assets/images/clubes/Turquia/kasimpasa.png'),
    Club('Eyüpspor', 70, 'assets/images/clubes/Turquia/eyupspor.png'),
    Club('Çaykur Rizespor', 70, 'assets/images/clubes/Turquia/rizespor.png'),
    Club('Samsunspor', 70, 'assets/images/clubes/Turquia/samsunspor.png'),
    Club('Sivasspor', 69, 'assets/images/clubes/Turquia/sivasspor.png'),
    Club('Gaziantenp', 69, 'assets/images/clubes/Turquia/gaziantep.png'),

  ];

  Club? clube1;
  Club? clube2;

  void sortearClubes() {
    final random = Random();

    // Define o intervalo com base na variável
    final candidatos = clubes.where((c) {
      if (usarIntervaloBaixo) {
        return c.nivel >= 65 && c.nivel <= 79.5;
      } else {
        return c.nivel > 79.5 && c.nivel <= 99;
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
              'assets/images/app/cenary.png',
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
                    Image.asset(clube1!.escudoPath, height: 100),
                    SizedBox(height: 15),
                    Text(
                      '${clube1!.nome} (${clube1!.nivel})',
                      style: TextStyle(
                        fontFamily: 'ChampionsBold',
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 13),
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
                    SizedBox(height: 13),
                    // Clube 2 - escudo em cima, nome ao lado
                    Column(
                      children: [
                        Image.asset(clube2!.escudoPath, height: 100),
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
                SizedBox(height: 140),
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
