import 'package:flutter/material.dart';

import 'jogo.dart';
import 'tela_dois.dart';
import 'widgets.dart';

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp());
}

// Widget base do aplicativo, sem estado
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      // Define a cor tema baseada na cor vermelha
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      home: const MyHomePage(title: 'Pedra, Papel, Tesoura'),
      // Remove a faixa de "Debug" no canto da tela
      debugShowCheckedModeBanner: false,
    );
  }
}

// Tela principal: o jogador escolhe pedra, papel ou tesoura
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  void _escolher(BuildContext context, Jogada escolha) {
    // Passa a escolha do jogador para a tela de resultado
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDois(title: title, escolhaJogador: escolha),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraDoJogo(title),
      body: Column(
        // Espaça os elementos verticalmente de forma igual
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Área de "Escolha do APP", com a interrogação até o jogador escolher
          const ImagemCircular(
            imagem: 'assets/images/padrao.png',
            legenda: 'Escolha do APP',
            tamanhoLegenda: 20,
            espacoLegenda: 20,
          ),
          // Opções para o jogador
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final jogada in Jogada.values)
                GestureDetector(
                  key: Key('opcao-${jogada.name}'),
                  onTap: () => _escolher(context, jogada),
                  child: ImagemCircular(
                    imagem: jogada.imagem,
                    tamanho: 80,
                    alturaImagem: 50,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
