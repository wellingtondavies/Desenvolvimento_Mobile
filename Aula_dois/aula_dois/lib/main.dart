import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Inicia o aplicativo
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // Tema do aplicativo (define cores principais)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 9, 180, 32),
        ),
      ),

      // Tela inicial
      home: const MyHomePage(title: 'Frases do dia'),
    );
  }
}

// Tela principal
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Estado da tela (onde ficam as variáveis)
class _MyHomePageState extends State<MyHomePage> {

  // Contador usado para trocar as frases
  int _counter = 0;

  // Lista de frases
  List<String> frases = [
    "A persistência é o caminho do êxito.",
    "O sucesso é a soma de pequenos esforços repetidos dia após dia.",
    "Acredite em si mesmo e todo o resto virá naturalmente.",
    "A única maneira de fazer um excelente trabalho é amar o que você faz.",
    "O futuro pertence àqueles que acreditam na beleza de seus sonhos."
  ];

  // Frase que será mostrada
  String fraseRandomica = "";

  // Frase inicial
  String frasePadrao = "Clique abaixo para gerar uma frase!";

  // Função chamada quando clicar no botão
  void _incrementCounter() {
    setState(() {

      // Incrementa o contador
      _counter++;

      // Escolhe uma frase da lista
      fraseRandomica = frases[_counter % frases.length];

      // Atualiza o texto na tela
      frasePadrao = fraseRandomica;

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

      // Conteúdo da tela
      body: Center(
        child: Column(

          // Centraliza os elementos verticalmente
          mainAxisAlignment: MainAxisAlignment.center,

          // Centraliza horizontalmente
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            // Logo do aplicativo
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),

              // Imagem da pasta assets
              child: Image.asset('assets/images/logo.png'),
            ),

            // Espaço entre logo e texto
            SizedBox(height: 60),

            // Texto com a frase
            Text(
              frasePadrao,

              // Centraliza o texto
              textAlign: TextAlign.center,

              // Estilo do texto
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),

            // Espaço entre texto e botão
            SizedBox(height: 40),

            // BOTÃO "NOVA FRASE"
            ElevatedButton(

              // Função executada ao clicar
              onPressed: _incrementCounter,

              // Estilo do botão
              style: ElevatedButton.styleFrom(

                // Cor verde do botão
                backgroundColor: const Color.fromARGB(255, 9, 180, 32),

                // Espaçamento interno (tamanho do botão)
                padding: EdgeInsets.symmetric(
                  horizontal: 40, // largura
                  vertical: 12,   // altura
                ),

                // Deixa o botão arredondado
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              // Texto do botão
              child: Text(
                "Nova Frase",

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