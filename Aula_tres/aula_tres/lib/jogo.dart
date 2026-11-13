import 'dart:math';

/// Opções do jogo. A ordem (pedra, papel, tesoura) é a mesma dos botões da tela.
enum Jogada {
  pedra('assets/images/pedra.png'),
  papel('assets/images/papel.png'),
  tesoura('assets/images/tesoura.png');

  const Jogada(this.imagem);

  final String imagem;

  /// Jogada que esta vence: pedra quebra tesoura, papel embrulha pedra, tesoura corta papel.
  Jogada get vence => switch (this) {
        Jogada.pedra => Jogada.tesoura,
        Jogada.papel => Jogada.pedra,
        Jogada.tesoura => Jogada.papel,
      };

  static Jogada aleatoria([Random? random]) =>
      Jogada.values[(random ?? Random()).nextInt(Jogada.values.length)];
}

enum Resultado {
  vitoria('Você venceu!', 'assets/images/vitória.png'),
  derrota('Você Perdeu!', 'assets/images/perder.png'),
  empate('Empate!', 'assets/images/aperto-de-mãos.png');

  const Resultado(this.texto, this.imagem);

  final String texto;
  final String imagem;
}

/// Regra do jogo, separada da interface para poder ser testada sem widgets.
Resultado jogar(Jogada jogador, Jogada app) {
  if (jogador == app) return Resultado.empate;
  return jogador.vence == app ? Resultado.vitoria : Resultado.derrota;
}
