import '../../domain/models/user.dart';

class UserDto {
  static Map toMap(User user) => {
        'nome': user.nome,
        'sobrenome': user.sobreNome,
        'nomeCompleto': "${user.nome} ${user.sobreNome}",
        'dtNac': user.dtNasc.toIso8601String(),
      };
}
