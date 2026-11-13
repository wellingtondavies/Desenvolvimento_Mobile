# Desenvolvimento Mobile

Aulas e trabalho da disciplina de Desenvolvimento Mobile, todos em Flutter. Os projetos vão do
contador gerado pelo `flutter create` até um formulário de cadastro com validação e navegação entre
telas.

Projeto acadêmico de Engenharia de Software — Centro Universitário FAG.

**Autor:** Wellington Davies dos Santos.

## Estrutura do repositório

| Pasta                       | Projeto                       | Conceitos                                           |
| --------------------------- | ----------------------------- | --------------------------------------------------- |
| `Aula_um/`                  | Contador                      | Estrutura de um app, `StatefulWidget`, `setState`  |
| `Aula_dois/aula_dois/`      | Frases do dia                 | Estado, imagens locais, estilo de botões            |
| `Aula_tres/aula_tres/`      | Pedra, Papel e Tesoura        | Navegação entre telas e passagem de parâmetros      |
| `Aula_quatro/aula_quatro/`  | Pedra, Papel e Tesoura (final)| Mesmo jogo, versão de entrega                       |
| `trabalho_mobile/`          | Cadastro de usuário           | Formulário, validação, SnackBar, tela de confirmação |

Cada pasta tem o próprio README com o que o app faz e como rodar.

## Como executar

Requisito: Flutter SDK (Dart 3.7 ou mais recente).

```bash
cd Aula_tres/aula_tres      # ou a pasta do projeto desejado
flutter pub get
flutter run
flutter test
```

`Aula_quatro` e `trabalho_mobile` foram entregues só com `lib/` e `pubspec.yaml`; antes do primeiro
`flutter run`, rode `flutter create .` dentro da pasta para gerar as pastas de plataforma.

## Organização do código

Nos projetos maiores, a regra de negócio fica em um arquivo Dart puro, separado das telas
(`jogo.dart` no Pedra, Papel e Tesoura e `validacao.dart` no cadastro). Assim ela pode ser testada
com `flutter test` sem montar nenhum widget.
