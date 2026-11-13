import 'package:flutter/material.dart';

import 'tela_confirmacao.dart';
import 'validacao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Cadastro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Cadastro de Usuário'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textoEmail = TextEditingController();
  final _textoNome = TextEditingController();
  final _textoIdade = TextEditingController();

  bool termos = false;
  String? sexo;

  // Controllers precisam ser liberados quando a tela sai da árvore
  @override
  void dispose() {
    _textoEmail.dispose();
    _textoNome.dispose();
    _textoIdade.dispose();
    super.dispose();
  }

  InputDecoration _decoracao(String label, String dica) {
    return InputDecoration(
      hintText: dica,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      label: Text(label),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  void _cadastrar() {
    // Valida na mesma ordem em que os campos aparecem e para no primeiro erro
    final erro = validarNome(_textoNome.text) ??
        validarIdade(_textoIdade.text) ??
        validarEmail(_textoEmail.text) ??
        validarSexo(sexo) ??
        validarTermos(termos);

    if (erro != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(erro)));
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaConfirmacao(
          nome: _textoNome.text.trim(),
          idade: int.parse(_textoIdade.text.trim()),
          email: _textoEmail.text.trim(),
          sexo: sexo!,
          termos: termos,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Preencha os campos abaixo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  key: const Key('campo-nome'),
                  controller: _textoNome,
                  textInputAction: TextInputAction.next,
                  decoration: _decoracao('Nome', 'Digite seu nome completo'),
                ),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('campo-email'),
                  controller: _textoEmail,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _decoracao('Email', 'Digite seu email'),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
                    key: const Key('campo-idade'),
                    controller: _textoIdade,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text('Idade'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButton<String>(
                  key: const Key('campo-sexo'),
                  hint: const Text('Sexo'),
                  value: sexo,
                  items: const ['Masculino', 'Feminino', 'Outro']
                      .map((valor) => DropdownMenuItem<String>(
                            value: valor,
                            child: Text(valor),
                          ))
                      .toList(),
                  onChanged: (valor) => setState(() => sexo = valor),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Aceito os termos de uso'),
                    Checkbox(
                      key: const Key('campo-termos'),
                      value: termos,
                      onChanged: (valor) => setState(() => termos = valor ?? false),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  onPressed: _cadastrar,
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
