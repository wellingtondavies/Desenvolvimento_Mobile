/// Regras do formulário de cadastro, separadas da tela para poderem ser testadas.
/// Cada função devolve a mensagem de erro, ou null quando o valor é válido.
library;

const idadeMinima = 18;

final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

String? validarNome(String nome) {
  if (nome.trim().isEmpty) return 'O nome não pode ser vazio';
  return null;
}

String? validarIdade(String idade) {
  final valor = int.tryParse(idade.trim());
  if (valor == null) return 'A idade deve ser um número válido';
  if (valor <= 0) return 'A idade deve ser um número positivo';
  if (valor < idadeMinima) return 'Você deve ser maior de idade para se cadastrar';
  return null;
}

String? validarEmail(String email) {
  if (!_emailRegex.hasMatch(email.trim())) return 'Digite um email válido';
  return null;
}

String? validarSexo(String? sexo) {
  if (sexo == null) return 'Selecione o sexo';
  return null;
}

String? validarTermos(bool aceitou) {
  if (!aceitou) return 'Você deve aceitar os termos de uso';
  return null;
}
