import 'dart:math';

import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget {
  
  final String nome;
  final int idade;
  final String email;
  final String sexo;
  final bool termos;

  const TelaConfirmacao({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Confirmação'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Nome: $nome'),
            Text('Idade: $idade'),
            Text('Email: $email'),
            Text('Sexo: $sexo'),
            Text('Termos aceitos: ${termos ? "Sim" : "Não"}'),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Voltar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Editar'),
                  ),
                ],
            )
          ],
        ),
      ),
    );
  }
}