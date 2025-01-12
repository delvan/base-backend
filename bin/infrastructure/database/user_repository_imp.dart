import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/user.dart';
import '../../domain/ports/outputs/user_repository.dart';

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
  getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getUsers() async {
    final String _query = '''
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

    var result = await _database.query(_query);

    List<User> users =
        result.map((r) => _mapper.toDomain(r.fields)).toList().cast<User>();

    return users;
  }

  @override
  saveUser(User user) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
