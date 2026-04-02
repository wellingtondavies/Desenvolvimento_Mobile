import 'package:flutter/material.dart';
import 'tela_confirmacao.dart';

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
        "/": (context) => const MyHomePage(title: 'Cadastro de Usuário'),
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
                  controller: _textoNome,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Digite seu nome completo",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    label: const Text('Nome'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _textoEmail,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Digite seu email",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    label: const Text('Email'),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 100,
                  child: TextField(
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
                  hint: const Text('Sexo'),
                  value: sexo,
                  items: ['Masculino', 'Feminino', 'Outro'].map((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(valor),
                    );
                  }).toList(),
                  onChanged: (valor) {
                    setState(() {
                      sexo = valor;
                    });
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Aceito os termos de uso'),
                    Checkbox(
                      value: termos,
                      onChanged: (valor) {
                        setState(() {
                          termos = valor ?? false;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                    foregroundColor: Colors.white, // Cor do texto
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12), // Deixa o botão maiorzinho
                    ),
                    
                  onPressed: () {
                    if (_textoNome.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('O nome não pode ser vazio')),
                      );
                      return; 
                    }

                    try {
                      int idade = int.parse(_textoIdade.text);
                      if (idade <= 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('A idade deve ser um número positivo')),
                        );
                        return;
                      }else if (idade < 18) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Você deve ser maior de idade para se cadastrar')),
                        );
                        return;
                      }

                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('A idade deve ser um número válido')),
                      );
                      return;
                    }

                    if (_textoEmail.text.trim().isEmpty || !_textoEmail.text.contains('@') || !_textoEmail.text.contains('.')) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Digite um email válido')),
                      );
                      return;
                    }

                    if (sexo == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Selecione o sexo')),
                      );
                      return;
                    }

                    if (!termos) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Você deve aceitar os termos de uso')),
                      );
                      return;
                    }

                    int idadeValida = int.parse(_textoIdade.text);
                    Navigator.push(
                    context,
                          MaterialPageRoute(
                          builder: (context) => TelaConfirmacao(
                          nome: _textoNome.text,
                          idade: idadeValida,
                          email: _textoEmail.text,
                          sexo: sexo!, 
                          termos: termos,
                        ),
                      ),
                    );
                    
                  },
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
