import '../models/estabelecimento.dart';
import '../ports/inputs/estabelecimento_service.dart';
import '../ports/outputs/estabelecimento_repository.dart';

class EstabecelimentoServiceImp implements EstabelecimentoService {
  final EstabelecimentoRepository _estabelecimentoRepository;

  EstabecelimentoServiceImp(this._estabelecimentoRepository);

  @override
  Future<List<Estabelecimento>> getAllEstabelecimentos() {
    return _estabelecimentoRepository.getEstabelecimentos();
  }

  @override
  Future<bool> save(Estabelecimento estabelecimento) {
    return _estabelecimentoRepository.saveEstabelecimento(estabelecimento);
  }
}
