# Aula 4 — Pedra, Papel e Tesoura (versão final)

Versão de entrega do jogo da aula 3, com o mesmo código organizado em regra (`jogo.dart`), telas e
widgets reutilizáveis.

| Arquivo            | Conteúdo                                                                 |
| ------------------ | ------------------------------------------------------------------------ |
| `lib/jogo.dart`    | Regra do jogo: `Jogada`, `Resultado` e `jogar()`, sem nenhum widget       |
| `lib/main.dart`    | Tela inicial com as três opções                                           |
| `lib/tela_dois.dart` | Sorteia a jogada do app e mostra o resultado                            |
| `lib/widgets.dart` | `ImagemCircular` e a barra do app, usados nas duas telas                  |
| `test/`            | Testes da regra (todas as combinações) e das telas                        |

## Como executar

Requisito: Flutter SDK (Dart 3.7 ou mais recente).

Nesta entrega foram versionados só `lib/`, `test/`, `assets/` e o `pubspec.yaml`. Na primeira vez, gere as
pastas de plataforma (Android, iOS, web etc.) dentro da pasta do projeto:

```bash
flutter create .
flutter pub get
flutter run
flutter test
```
