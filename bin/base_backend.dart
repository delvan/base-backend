import 'package:commons_core/commons_core.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'application/dtos/user_dto.dart';

import 'application/web/user_controller.dart';
import 'core/database/database.dart';
import 'core/database/database_mysql_adapter.dart';
import 'core/database/mapper.dart';
import 'domain/models/user.dart';
import 'domain/ports/inputs/user_service.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'infrastructure/mappers/user_mapper.dart';

void main(List<String> args) async {
  print(await DatabaseMySqlAdapter().query('select * from tb_permissoes'));

  final Mapper _userMapper = UserMapper();
  final Database _database = DatabaseMySqlAdapter();
  final UserRepository _userRepository =
      UserRepositoryImp(_database, _userMapper);
  final UserService _userService = UserServiceImp(_userRepository);
  final UserController _userController = UserController(_userService);

  _userService
      .save(UserDto(
        'Fulano4',
        'testando4',
        DateTime.utc(2024, 1, 16),
        '546461217',
        'email4@gmail.com',
        'Caxias',
        'A',
        'passwor123',
        'token',
      ))
      .then((value) => print(value));

  var cascateHandler = Cascade().add((_userController.getHandler())).handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascateHandler);

  shelf_io.serve(
    handler,
    await CustonEnv.get<String>(key: 'server_ip'),
    await CustonEnv.get<int>(key: 'server_port'),
  );
}
