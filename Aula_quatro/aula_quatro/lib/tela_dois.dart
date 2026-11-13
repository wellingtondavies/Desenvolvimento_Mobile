import 'package:flutter/material.dart';

import 'jogo.dart';
import 'widgets.dart';

/// Tela de resultado: sorteia a jogada do app e mostra quem venceu.
class TelaDois extends StatefulWidget {
  const TelaDois({
    super.key,
    required this.title,
    required this.escolhaJogador,
    this.escolhaApp,
  });

  final String title;
  final Jogada escolhaJogador;

  /// Jogada fixa do app, usada nos testes. Se for nula, é sorteada.
  final Jogada? escolhaApp;

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  late final Jogada escolhaApp;
  late final Resultado resultado;

  @override
  void initState() {
    super.initState();
    // O sorteio acontece uma vez só, quando a tela abre
    escolhaApp = widget.escolhaApp ?? Jogada.aleatoria();
    resultado = jogar(widget.escolhaJogador, escolhaApp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraDoJogo(widget.title),
      // SizedBox com double.infinity faz a coluna ocupar toda a largura,
      // o que centraliza os itens na horizontal
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImagemCircular(imagem: escolhaApp.imagem, legenda: 'Escolha do APP'),
            ImagemCircular(imagem: widget.escolhaJogador.imagem, legenda: 'Sua Escolha'),
            Column(
              children: [
                Image.asset(resultado.imagem, height: 100),
                const SizedBox(height: 10),
                Text(
                  resultado.texto,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Jogar novamente',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
