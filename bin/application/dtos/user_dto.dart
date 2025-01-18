import '../../domain/models/user.dart';

class UserDto extends User {
  final int id;
  final String password;
  final String deviceToken;

  UserDto(
    super.nome,
    super.sobreNome,
    super.dtNasc,
    super.documento,
    super.email,
    super.cidade,
    super.status,
    this.password,
    this.deviceToken, [
    this.id = 0,
  ]);

//TODO: refatorar aqui
  static Map toMap(User user) => {
        'nome': user.nome,
        'sobrenome': user.sobreNome,
        'nomeCompleto': "${user.nome} ${user.sobreNome}",
        'dtNac': user.dtNasc.toIso8601String(),
      };

  static UserDto fromRequest(Map map) => UserDto(
        map['nome'],
        map['sobrenome'],
        DateTime.parse(map['dtNasc']),
        map['documento'],
        map['email'],
        map['cidade'],
        map['status'],
        map['password'],
        map['deviceToken'],
      );
}
