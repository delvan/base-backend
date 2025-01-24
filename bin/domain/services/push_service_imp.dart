import '../models/push.dart';
import '../ports/inputs/push_service.dart';
import '../ports/outputs/push_repository.dart';

class PushServiceImp implements PushService {
  final PushRepository _pushRepository;

  PushServiceImp(this._pushRepository);

  @override
  Future<List<Push>> getAllPushs() {
    return _pushRepository.getPushs();
  }

  @override
  Future<bool> save(Push push) {
    return _pushRepository.savePush(push);
  }
}
