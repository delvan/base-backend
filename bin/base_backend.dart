import 'package:commons_core/commons_core.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'application/web/categoria_controller.dart';
import 'application/web/estabelecimento_controller.dart';
import 'application/web/login_controller.dart';
import 'application/web/produto_controller.dart';
import 'application/web/user_controller.dart';
import 'application/web/venda_controller.dart';
import 'core/injections.dart';

void main(List<String> args) async {
  final i = Injections.init();

  var cascateHandler = Cascade()
      .add(i<LoginController>().getHandler())
      .add((i<UserController>().getHandler(isSecurity: true)))
      .add(i<EstabelecimentoController>().getHandler(isSecurity: true))
      .add(i<CategoriaController>().getHandler(isSecurity: true))
      .add(i<ProdutoController>().getHandler(isSecurity: true))
      .add(i<VendaController>().getHandler(isSecurity: true))
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
