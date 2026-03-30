import 'package:aula_tres/tela_dois.dart';
import 'package:flutter/material.dart';

// Função principal que inicia o aplicativo Flutter
void main() {
  runApp(const MyApp());
}

// Widget base do aplicativo, sem estado (não sofre alterações dinâmicas por conta própria)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedra, Papel, Tesoura',
      // Define a cor tema baseada na cor vermelha
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      // Define a tela inicial que será carregada
      home: const MyHomePage(title: 'Pedra, Papel, Tesoura'),
      //home: const TelaDois(title: 'Pedra, Papel, Tesoura'),
      // Remove a faixa de "Debug" no canto da tela
      debugShowCheckedModeBanner: false,
    );
  }
}

// Tela principal do aplicativo (StatefulWidget permite mudar o estado/tela durante o uso)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado da tela principal, onde a lógica visual e de jogo acontece
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura básica visual da tela (barra superior, corpo, etc)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 0, 0, 1), // Cor de fundo da barra
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      // Estrutura em coluna para empilhar os elementos verticalmente
      body: Column(
        // Espaça os elementos verticalmente de forma por igual
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Sub-coluna para a área de "Escolha do APP"
          Column(
            children: [
              // Círculo com a imagem da escolha que o app fez
              Container(
                width: 120,
                height: 120,
                decoration : BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle, // Formato circular
                  border: Border.all(color: Colors.grey, width: 2), // Borda cinza
                ),
                child: Center(
                  // Imagem padrão de interrogação ("padrao.png")
                  child: Image.asset('assets/images/padrao.png', height: 70),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento
              const Text(
                'Escolha do APP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Linha contendo as opções para o jogador escolher (Pedra, Papel ou Tesoura)
          Row(
            // Espaça as 3 opções horizontalmente por igual
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Chama a função _buildOpcao para construir os botões clicáveis
              _buildOpcao('assets/images/pedra.png', 0),
              _buildOpcao('assets/images/papel.png', 1),
              _buildOpcao('assets/images/tesoura.png', 2),
            ],
          ),
        ],
      ),
    );
  }

  // Função auxiliar que cria o botão visual para cada opção (Pedra, Papel, Tesoura)
  Widget _buildOpcao(String imagePath, int escolhaJogador) {
    // GestureDetector permite detectar cliques (toques) no container
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TelaDois(title: widget.title, escolhaJogador: escolhaJogador)),// passar variavel com a escolha do jogador para a próxima tela
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle, // Forma circular para os botões
          border: Border.all(color: Colors.grey, width: 2),
        ),
        child: Center(
          // Desenha a imagem correspondente recebida pelo parâmetro "imagePath"
          child: Image.asset(imagePath, height: 50),
        ),
      ),
    );
  }
}
