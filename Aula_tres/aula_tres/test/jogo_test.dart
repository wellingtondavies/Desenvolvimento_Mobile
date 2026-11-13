import 'dart:math';

import 'package:aula_tres/jogo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('regra do jogo', () {
    test('mesma jogada empata', () {
      for (final jogada in Jogada.values) {
        expect(jogar(jogada, jogada), Resultado.empate);
      }
    });

    test('pedra vence tesoura, papel vence pedra, tesoura vence papel', () {
      expect(jogar(Jogada.pedra, Jogada.tesoura), Resultado.vitoria);
      expect(jogar(Jogada.papel, Jogada.pedra), Resultado.vitoria);
      expect(jogar(Jogada.tesoura, Jogada.papel), Resultado.vitoria);
    });

    test('as combinações inversas são derrota', () {
      expect(jogar(Jogada.tesoura, Jogada.pedra), Resultado.derrota);
      expect(jogar(Jogada.pedra, Jogada.papel), Resultado.derrota);
      expect(jogar(Jogada.papel, Jogada.tesoura), Resultado.derrota);
    });

    test('sorteio só devolve jogadas válidas', () {
      final random = Random(42);
      for (var i = 0; i < 100; i++) {
        expect(Jogada.values, contains(Jogada.aleatoria(random)));
      }
    });
  });
}
