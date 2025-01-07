import 'package:commons_core/commons_core.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'core/database/database_mysql_adapter.dart';

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
}
