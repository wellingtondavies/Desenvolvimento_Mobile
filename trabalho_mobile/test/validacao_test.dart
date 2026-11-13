import 'package:flutter_test/flutter_test.dart';
import 'package:trabalho_mobile/validacao.dart';

void main() {
  test('nome vazio ou só com espaços é inválido', () {
    expect(validarNome(''), isNotNull);
    expect(validarNome('   '), isNotNull);
    expect(validarNome('Wellington'), isNull);
  });

  test('idade precisa ser número inteiro, positivo e de maior', () {
    expect(validarIdade('abc'), 'A idade deve ser um número válido');
    expect(validarIdade(''), 'A idade deve ser um número válido');
    expect(validarIdade('0'), 'A idade deve ser um número positivo');
    expect(validarIdade('-3'), 'A idade deve ser um número positivo');
    expect(validarIdade('17'), 'Você deve ser maior de idade para se cadastrar');
    expect(validarIdade('18'), isNull);
    expect(validarIdade(' 26 '), isNull);
  });

  test('email precisa ter usuário, @ e domínio com ponto', () {
    expect(validarEmail('teste'), isNotNull);
    expect(validarEmail('teste@'), isNotNull);
    expect(validarEmail('.@'), isNotNull);
    expect(validarEmail('a b@c.com'), isNotNull);
    expect(validarEmail('teste@fag.edu.br'), isNull);
  });

  test('sexo e termos são obrigatórios', () {
    expect(validarSexo(null), isNotNull);
    expect(validarSexo('Outro'), isNull);
    expect(validarTermos(false), isNotNull);
    expect(validarTermos(true), isNull);
  });
}
