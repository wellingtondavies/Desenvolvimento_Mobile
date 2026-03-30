import 'dart:math';

import 'package:flutter/material.dart';

class TelaDois extends StatefulWidget {
  const TelaDois({super.key, required this.title, required this.escolhaJogador});
  
  final String title; 
  final int escolhaJogador;

  @override
  State<TelaDois> createState() => _TelaDoisState();
}

class _TelaDoisState extends State<TelaDois> {
  final List<String> imagens = [
    'assets/images/pedra.png',
    'assets/images/papel.png',
    'assets/images/tesoura.png',
  ];

  late int escolhaApp;
  late String resultadoTexto;
  late String imagemResultado;

  @override
  void initState() {
    super.initState();
    _jogar();
  }

  void _jogar() {
    escolhaApp = Random().nextInt(3);

    if (widget.escolhaJogador == escolhaApp) {
      resultadoTexto = "Empate!";
      imagemResultado = "assets/images/aperto-de-mãos.png"; 
    } else if ((widget.escolhaJogador == 0 && escolhaApp == 2) ||
        (widget.escolhaJogador == 1 && escolhaApp == 0) ||
        (widget.escolhaJogador == 2 && escolhaApp == 1)) {
      resultadoTexto = "Você venceu!";
      imagemResultado = "assets/images/vitória.png";
    } else {
      resultadoTexto = "Você Perdeu!";
      imagemResultado = "assets/images/perder.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 0, 0, 1), // Cor de fundo da barra
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      // SizedBox com double.infinity garante que a coluna ocupe toda a largura da tela,
      // facilitando o alinhamento dos itens no centro horizontal.
      body: SizedBox(
        width: double.infinity,
        child: Column(
          // Distribui o espaço igualmente entre os blocos
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle, // Formato circular
                    border: Border.all(color: Colors.grey, width: 2), // Borda cinza
                  ),
                  child: Center(
                    // Imagem da escolha do app
                    child: Image.asset(imagens[escolhaApp], height: 70),
                  ),
                ),
                const SizedBox(height: 10), // Espaçamento entre imagem e texto
                const Text(
                  "Escolha do APP",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Center(
                    // Imagem da escolha do usuário
                    child: Image.asset(imagens[widget.escolhaJogador], height: 70),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Sua Escolha",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            Column(
              children: [
                // Usando a imagem estática de derrota listada no seu pubspec.yaml
                Image.asset(imagemResultado, height: 100),
                const SizedBox(height: 10),
                Text(
                  resultadoTexto,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Cor vermelha do botão
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borda levemente arredondada
                ),
              ),
              child: const Text(
                "Jogar novamente",
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}