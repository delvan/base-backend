import 'package:commons_core/commons_core.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'domain/ports/inputs/user_service.dart';

import 'core/database/database.dart';
import 'core/database/database_mysql_adapter.dart';
import 'core/database/mapper.dart';

import 'infrastructure/mappers/user_mapper.dart';
import 'domain/services/user_service_imp.dart';
import 'infrastructure/database/user_repository_imp.dart';
import 'domain/ports/outputs/user_repository.dart';
import 'application/web/user_controller.dart';

import 'infrastructure/mappers/estabelecimento_mapper.dart';
import 'domain/ports/inputs/estabelecimento_service.dart';
import 'domain/ports/outputs/estabelecimento_repository.dart';
import 'infrastructure/database/estabelecimento_repository_imp.dart';
import 'domain/services/estabecelimento_service_imp.dart';
import 'application/web/estabelecimento_controller.dart';

import 'infrastructure/mappers/produto_mapper.dart';
import 'domain/ports/inputs/produto_service.dart';
import 'application/web/produto_controller.dart';
import 'infrastructure/database/produto_repository_imp.dart';
import 'domain/services/produto_service_imp.dart';
import 'domain/ports/outputs/produto_repository.dart';

import 'infrastructure/mappers/categoria_mapper.dart';
import 'domain/ports/inputs/categoria_service.dart';
import 'domain/services/categoria_service_imp.dart';
import 'infrastructure/database/categoria_repository_imp.dart';
import 'domain/ports/outputs/categoria_repository.dart';
import 'application/web/categoria_controller.dart';

void main(List<String> args) async {
  final Mapper _userMapper = UserMapper();
  final Mapper _estabelecimentoMapper = EstabelecimentoMapper();
  final Mapper _produtoMapper = ProdutoMapper();
  final Mapper _categoriaMapper = CategoriaMapper();
  final Database _database = DatabaseMySqlAdapter();

  final UserRepository _userRepository =
      UserRepositoryImp(_database, _userMapper);
  final UserService _userService = UserServiceImp(_userRepository);
  final UserController _userController = UserController(_userService);

  final ProdutoRepository _produtoRepository =
      ProdutoRepositoryImp(_database, _produtoMapper);
  final ProdutoService _produtoService = ProdutoServiceImp(_produtoRepository);
  final ProdutoController _produtoController =
      ProdutoController(_produtoService);

  final EstabelecimentoRepository _estabelecimentoRepository =
      EstabelecimentoRepositoryImp(_database, _estabelecimentoMapper);
  final EstabelecimentoService _estabelecimentoService =
      EstabecelimentoServiceImp(_estabelecimentoRepository);
  final EstabelecimentoController _estabelecimentoController =
      EstabelecimentoController(_estabelecimentoService);

  final CategoriaRepository _categoriaRepository =
      CategoriaRepositoryImp(_database, _categoriaMapper);
  final CategoriaService _categoriaService =
      CategoriaServiceImp(_categoriaRepository);
  final CategoriaController _categoriaController =
      CategoriaController(_categoriaService);

  var cascateHandler = Cascade()
      .add((_userController.getHandler()))
      .add(_produtoController.getHandler())
      .add(_estabelecimentoController.getHandler())
      .add(_categoriaController.getHandler())
      .handler;

  var handler =
      Pipeline().addMiddleware(logRequests()).addHandler(cascateHandler);

  shelf_io
      .serve(
        handler,
        await CustonEnv.get<String>(key: 'server_ip'),
        await CustonEnv.get<int>(key: 'server_port'),
      )
      .then((s) =>
          print("Servidor incializado http://${s.address.address}:${s.port}"));
}
