import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';

class UserMapper implements Mapper<User> {
  @override
  User toDomain(Map map) => User(
        id: map['id'],
        nome: map['nome'],
        sobreNome: map['sobrenome'],
        dtNasc: map['dtNasc'],
        documento: map['documento'],
        email: map['email'],
        cidade: map['cidade'],
        status: map['status'],
      );
}
