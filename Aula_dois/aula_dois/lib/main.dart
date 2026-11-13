import 'package:flutter/material.dart';

const corPrincipal = Color.fromARGB(255, 9, 180, 32);

void main() {
  runApp(const MyApp()); // Inicia o aplicativo
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases do dia',
      // Tema do aplicativo (define cores principais)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: corPrincipal),
      ),
      // Tela inicial
      home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

/// Frases exibidas em sequência a cada toque no botão.
const frases = [
  'A persistência é o caminho do êxito.',
  'O sucesso é a soma de pequenos esforços repetidos dia após dia.',
  'Acredite em si mesmo e todo o resto virá naturalmente.',
  'A única maneira de fazer um excelente trabalho é amar o que você faz.',
  'O futuro pertence àqueles que acreditam na beleza de seus sonhos.',
];

const textoInicial = 'Clique abaixo para gerar uma frase!';

// Tela principal
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado da tela (onde ficam as variáveis)
class _MyHomePageState extends State<MyHomePage> {
  // Posição da frase atual na lista; -1 enquanto nenhuma foi mostrada
  int _indice = -1;

  String get _textoAtual => _indice < 0 ? textoInicial : frases[_indice];

  // Avança para a próxima frase e volta ao início depois da última
  void _proximaFrase() {
    setState(() {
      _indice = (_indice + 1) % frases.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior verde
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // Centraliza os elementos na vertical e na horizontal
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Logo do aplicativo (pasta assets)
            Container(
              width: 200,
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset('assets/images/logo.png'),
            ),

            const SizedBox(height: 60),

            // Frase atual
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _textoAtual,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Botão "Nova Frase"
            ElevatedButton(
              onPressed: _proximaFrase,
              style: ElevatedButton.styleFrom(
                backgroundColor: corPrincipal,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                // Botão arredondado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Nova Frase',
                style: TextStyle(
                  fontSize: 16,
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
