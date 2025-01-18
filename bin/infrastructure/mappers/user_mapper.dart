import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';

class UserMapper implements Mapper<User> {
  @override
  User toDomain(Map map) => User(
        map['nome'],
        map['sobrenome'],
        map['dtNasc'],
        map['documento'],
        map['email'],
        map['cidade'],
        map['status'],
      );
}
