import 'package:commons_core/commons_core.dart';

import 'database/database.dart';

import 'database/database_mysql_adapter.dart';

import '../infrastructure/mappers/user_mapper.dart';
import '../domain/services/user_service_imp.dart';
import '../infrastructure/database/user_repository_imp.dart';
import '../domain/ports/outputs/user_repository.dart';
import '../application/web/user_controller.dart';
import '../domain/ports/inputs/user_service.dart';

import '../infrastructure/mappers/estabelecimento_mapper.dart';
import '../domain/ports/inputs/estabelecimento_service.dart';
import '../domain/ports/outputs/estabelecimento_repository.dart';
import '../infrastructure/database/estabelecimento_repository_imp.dart';
import '../domain/services/estabecelimento_service_imp.dart';
import '../application/web/estabelecimento_controller.dart';

import '../infrastructure/mappers/produto_mapper.dart';
import '../domain/ports/inputs/produto_service.dart';
import '../application/web/produto_controller.dart';
import '../infrastructure/database/produto_repository_imp.dart';
import '../domain/services/produto_service_imp.dart';
import '../domain/ports/outputs/produto_repository.dart';

import '../infrastructure/mappers/categoria_mapper.dart';
import '../domain/ports/inputs/categoria_service.dart';
import '../domain/services/categoria_service_imp.dart';
import '../infrastructure/database/categoria_repository_imp.dart';
import '../domain/ports/outputs/categoria_repository.dart';
import '../application/web/categoria_controller.dart';

import '../infrastructure/mappers/venda_mapper.dart';
import '../domain/ports/inputs/venda_service.dart';
import '../domain/services/venda_service_imp.dart';
import '../infrastructure/database/vendas_repository_imp.dart';
import '../domain/ports/outputs/venda_repository.dart';
import '../application/web/venda_controller.dart';

import '../infrastructure/mappers/login_mapper.dart';
import '../domain/ports/inputs/login_service.dart';
import '../domain/services/login_service_imp.dart';
import '../infrastructure/database/login_repository_imp.dart';
import '../domain/ports/outputs/login_repository.dart';
import '../application/web/login_controller.dart';
import '../core/security/security_service.dart';
import '../core/security/security_service_imp.dart';

class Injections {
  static DependencyInjector init() {
    var di = DependencyInjector();

    di.register<Database>(() => DatabaseMySqlAdapter());

    //User
    di.register<UserRepository>(
        () => UserRepositoryImp(di<Database>(), UserMapper()));
    di.register<UserService>(() => UserServiceImp(di<UserRepository>()));
    di.register<UserController>(() => UserController(di<UserService>()));

    //Produto
    di.register<ProdutoRepository>(
        () => ProdutoRepositoryImp(di<Database>(), ProdutoMapper()));
    di.register<ProdutoService>(
        () => ProdutoServiceImp(di<ProdutoRepository>()));
    di.register<ProdutoController>(
        () => ProdutoController(di<ProdutoService>()));

    //Estabelecimento
    di.register<EstabelecimentoRepository>(() =>
        EstabelecimentoRepositoryImp(di<Database>(), EstabelecimentoMapper()));
    di.register<EstabelecimentoService>(
        () => EstabecelimentoServiceImp(di<EstabelecimentoRepository>()));
    di.register<EstabelecimentoController>(
        () => EstabelecimentoController(di<EstabelecimentoService>()));

    //Categoria
    di.register<CategoriaRepository>(
        () => CategoriaRepositoryImp(di<Database>(), CategoriaMapper()));
    di.register<CategoriaService>(
        () => CategoriaServiceImp(di<CategoriaRepository>()));
    di.register<CategoriaController>(
        () => CategoriaController(di<CategoriaService>()));

    //Categoria
    di.register<VendaRepository>(
        () => VendasRepositoryImp(di<Database>(), VendaMapper()));
    di.register<VendaService>(() => VendaServiceImp(di<VendaRepository>()));
    di.register<VendaController>(() => VendaController(di<VendaService>()));

    //Login
    di.register<LoginRepository>(
        () => LoginRepositoryImp(di<Database>(), LoginMapper()));
    di.register<LoginService>(() => LoginServiceImp(di<LoginRepository>()));
    di.register<SecurityService>(() => SecurityServiceImp(di<LoginService>()));
    di.register<LoginController>(
        () => LoginController(di<LoginService>(), di<SecurityService>()));

    return di;
  }
}
