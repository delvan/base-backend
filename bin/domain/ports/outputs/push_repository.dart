import '../../models/push.dart';

abstract class PushRepository {
  Future<List<Push>> getPushs();

  Future<bool> savePush(Push push);

  Push getPushById(int id);
}
