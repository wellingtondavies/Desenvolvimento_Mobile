import 'package:aula_tres/jogo.dart';
import 'package:aula_tres/main.dart';
import 'package:aula_tres/tela_dois.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tela inicial mostra as três opções', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Escolha do APP'), findsOneWidget);
    for (final jogada in Jogada.values) {
      expect(find.byKey(Key('opcao-${jogada.name}')), findsOneWidget);
    }
  });

  testWidgets('escolher uma opção abre a tela de resultado', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('opcao-pedra')));
    await tester.pumpAndSettle();

    expect(find.text('Sua Escolha'), findsOneWidget);
    expect(find.text('Jogar novamente'), findsOneWidget);
  });

  testWidgets('resultado mostra vitória quando pedra enfrenta tesoura', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: TelaDois(
        title: 'Teste',
        escolhaJogador: Jogada.pedra,
        escolhaApp: Jogada.tesoura,
      ),
    ));

    expect(find.text('Você venceu!'), findsOneWidget);
  });
}
