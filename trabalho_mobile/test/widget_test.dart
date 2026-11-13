import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_mobile/main.dart';

void main() {
  testWidgets('cadastrar com o formulário vazio mostra o erro do nome', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.ensureVisible(find.text('Cadastrar'));
    await tester.tap(find.text('Cadastrar'));
    await tester.pump();

    expect(find.text('O nome não pode ser vazio'), findsOneWidget);
  });

  testWidgets('com tudo preenchido abre a tela de confirmação', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('campo-nome')), 'Wellington');
    await tester.enterText(find.byKey(const Key('campo-email')), 'teste@fag.edu.br');
    await tester.enterText(find.byKey(const Key('campo-idade')), '26');

    await tester.tap(find.byKey(const Key('campo-sexo')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Masculino').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('campo-termos')));
    await tester.pump();

    await tester.ensureVisible(find.text('Cadastrar'));
    await tester.tap(find.text('Cadastrar'));
    await tester.pumpAndSettle();

    expect(find.text('Confirmação'), findsOneWidget);
    expect(find.text('Nome: Wellington'), findsOneWidget);
    expect(find.text('Idade: 26'), findsOneWidget);
  });
}
