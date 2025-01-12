import 'package:commons_core/commons_core.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'application/web/user_controller.dart';
import 'core/database/database.dart';
import 'core/database/database_mysql_adapter.dart';
import 'core/database/mapper.dart';
import 'domain/ports/inputs/user_service.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'infrastructure/mappers/user_mapper.dart';

void main(List<String> args) async {
  /*await DatabaseMySqlAdapter()
      .query("insert into tb_permissoes(nome, status) values ('ADMIN', 'A')");
  */

  print(await DatabaseMySqlAdapter().query('select * from tb_permissoes'));

/*
  await serve(
    (Request req) => Response(
      200,
      body: 'Ola mundo',
      headers: {'content-type': 'application/json'},
    ),
    'localhost',
    8080,
  );

 */

  final Mapper _userMapper = UserMapper();

  final Database _database = DatabaseMySqlAdapter();

  final UserRepository _userRepository =
      UserRepositoryImp(_database, _userMapper);

  final UserService _userService = UserServiceImp(_userRepository);

  final UserController _userController = UserController(_userService);

  _userController.getUsers();
}
