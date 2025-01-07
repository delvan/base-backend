import 'package:commons_core/commons_core.dart';

import 'database.dart';

import 'package:mysql1/mysql1.dart';

class DatabaseMySqlAdapter implements Database {
  @override
  Future<MySqlConnection> get getConnection async =>
      await MySqlConnection.connect(ConnectionSettings(
        host: await CustonEnv.get<String>(key: 'host'),
        port: await CustonEnv.get<int>(key: 'port'),
        user: await CustonEnv.get<String>(key: 'user'),
        db: await CustonEnv.get<String>(key: 'db'),
        password: await CustonEnv.get<String>(key: 'password'),
      ));

  @override
  query(String sql, [List? params]) async {
    var conn = await getConnection;
    return conn.query(sql, params);
  }
}
