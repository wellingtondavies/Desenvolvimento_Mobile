# Aula 3 — Pedra, Papel e Tesoura

Jogo de pedra, papel e tesoura com duas telas: o jogador escolhe a jogada e o app sorteia a dele na
tela de resultado, que mostra as duas escolhas e quem venceu. Pratica navegação com
`Navigator.push`/`pop` e passagem de dados entre telas.

| Arquivo            | Conteúdo                                                                 |
| ------------------ | ------------------------------------------------------------------------ |
| `lib/jogo.dart`    | Regra do jogo: `Jogada`, `Resultado` e `jogar()`, sem nenhum widget       |
| `lib/main.dart`    | Tela inicial com as três opções                                           |
| `lib/tela_dois.dart` | Sorteia a jogada do app e mostra o resultado                            |
| `lib/widgets.dart` | `ImagemCircular` e a barra do app, usados nas duas telas                  |
| `test/`            | Testes da regra (todas as combinações) e das telas                        |

## Como executar

Requisito: Flutter SDK (Dart 3.7 ou mais recente).

```bash
flutter pub get
flutter run
flutter test
```
