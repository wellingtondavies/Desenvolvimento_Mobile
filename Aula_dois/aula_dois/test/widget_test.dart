import 'package:aula_dois/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('mostra o texto inicial e avança pelas frases em ordem', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(textoInicial), findsOneWidget);

    // Cada toque mostra a próxima frase, começando pela primeira da lista
    for (final frase in frases) {
      await tester.tap(find.text('Nova Frase'));
      await tester.pump();
      expect(find.text(frase), findsOneWidget);
    }

    // Depois da última, volta para a primeira
    await tester.tap(find.text('Nova Frase'));
    await tester.pump();
    expect(find.text(frases.first), findsOneWidget);
  });
}
