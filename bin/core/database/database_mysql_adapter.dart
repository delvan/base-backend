import 'package:commons_core/commons_core.dart';

import 'database.dart';

import 'package:mysql1/mysql1.dart';

class DatabaseMySqlAdapter implements Database {
  @override
  Future<MySqlConnection> get getConnection async =>
      await MySqlConnection.connect(ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        db: 'delivery',
        password: 'root',
      ));

  @override
  query(String sql, [List? params]) async {
    var conn = await getConnection;
    return conn.query(sql, params);
  }
}
