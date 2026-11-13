# Trabalho — Cadastro de usuário

Formulário de cadastro com nome, e-mail, idade, sexo e aceite dos termos. Ao tocar em
**Cadastrar**, os campos são validados na ordem em que aparecem e o primeiro erro aparece em uma
SnackBar. Com tudo válido, o app abre a tela de confirmação com os dados digitados.

| Campo  | Regra                                              |
| ------ | -------------------------------------------------- |
| Nome   | Obrigatório                                        |
| Idade  | Número inteiro, positivo e maior ou igual a 18     |
| E-mail | Formato `usuario@dominio.ext`                      |
| Sexo   | Obrigatório (Masculino, Feminino ou Outro)         |
| Termos | Precisam ser aceitos                               |

| Arquivo                   | Conteúdo                                         |
| ------------------------- | ------------------------------------------------ |
| `lib/main.dart`           | Tela do formulário                               |
| `lib/validacao.dart`      | Regras de validação, testáveis sem interface     |
| `lib/tela_confirmacao.dart` | Exibe os dados cadastrados                     |
| `test/validacao_test.dart` | Testes de cada regra, incluindo os limites      |

## Como executar

Requisito: Flutter SDK (Dart 3.7 ou mais recente).

Nesta entrega foram versionados só `lib/`, `test/` e o `pubspec.yaml`. Na primeira vez, gere as
pastas de plataforma (Android, iOS, web etc.) dentro da pasta do projeto:

```bash
flutter create .
flutter pub get
flutter run
flutter test
```
