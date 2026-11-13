import 'package:flutter/material.dart';

/// Barra vermelha com o título em branco, usada nas duas telas.
AppBar barraDoJogo(String titulo) {
  return AppBar(
    backgroundColor: const Color.fromRGBO(255, 0, 0, 1),
    title: Text(
      titulo,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

/// Imagem dentro de um círculo cinza, com legenda opcional embaixo.
/// Substitui os blocos de Container + BoxDecoration repetidos nas telas.
class ImagemCircular extends StatelessWidget {
  const ImagemCircular({
    super.key,
    required this.imagem,
    this.legenda,
    this.tamanho = 120,
    this.alturaImagem = 70,
    this.tamanhoLegenda = 18,
    this.espacoLegenda = 10,
  });

  final String imagem;
  final String? legenda;
  final double tamanho;
  final double alturaImagem;
  final double tamanhoLegenda;
  final double espacoLegenda;

  @override
  Widget build(BuildContext context) {
    final circulo = Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Center(child: Image.asset(imagem, height: alturaImagem)),
    );

    final texto = legenda;
    if (texto == null) return circulo;

    return Column(
      children: [
        circulo,
        SizedBox(height: espacoLegenda),
        Text(
          texto,
          style: TextStyle(fontSize: tamanhoLegenda, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
