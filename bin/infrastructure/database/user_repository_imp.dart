import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';
import '../../domain/ports/outputs/user_repository.dart';
import '../../application/dtos/user_dto.dart';

class UserRepositoryImp implements UserRepository {
  final Database _database;

  final Mapper _mapper;

  UserRepositoryImp(this._database, this._mapper);

  @override
  getUserByEmail(String email) {
    // TODO: implement getUserByEmail
    throw UnimplementedError();
  }

  @override
  User getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final String _sql = '''
        SELECT 
          id,
          nome,
          sobrenome,
          dtNasc,
          documento,
          email,
          cidade,
          status
        FROM tb_usuarios;

    ''';

    var result = await _database.query(_sql);

    List<User> users =
        result.map((r) => _mapper.toDomain(r.fields)).toList().cast<User>();

    return users;
  }

  @override
  Future<bool> saveUser(User user) async {
    user as UserDto;
    final String _sql = '''
        INSERT INTO tb_usuarios
         (nome, sobrenome, dtNasc, documento, email, senha, deviceToken, cidade, status)
        VALUES
         (?,?,?,?,?,?,?,?,?);

''';

    var result = await _database.query(_sql, [
      user.nome,
      user.sobreNome,
      user.dtNasc.toUtc(),
      user.documento,
      user.email,
      user.password,
      user.deviceToken,
      user.cidade,
      user.status,
    ]);

    return result.affectedRows > 0;
  }
}
