import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart'; // Certifique-se de que o caminho está correto para seu arquivo principal

void main() {
  testWidgets('Sorteio exibe dois clubes com nome e nível', (
    WidgetTester tester,
  ) async {
    // Constrói o app
    await tester.pumpWidget(const ClubSorteioApp());

    // Verifica que os textos com nome e nível ainda não estão visíveis
    expect(find.textContaining('('), findsNothing);

    // Toca no botão "Sortear Clubes"
    await tester.tap(find.text('Sortear Clubes'));
    await tester.pump();

    // Coleta todos os widgets de texto
    final textos = find.byType(Text).evaluate().map((e) {
      final widget = e.widget;
      return widget is Text ? widget.data ?? '' : '';
    }).toList();

    // Filtra os textos que contêm nome e nível (ex: 🔵 Barcelona (88))
    final clubesSorteados = textos
        .where((t) => t.contains('(') && t.contains(')'))
        .toList();

    // Verifica se dois clubes foram exibidos
    expect(
      clubesSorteados.length,
      2,
      reason: 'Devem aparecer dois clubes sorteados com nome e nível',
    );
  });
}
