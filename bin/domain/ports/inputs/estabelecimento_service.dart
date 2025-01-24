import '../../models/estabelecimento.dart';

abstract class EstabelecimentoService {
  Future<List<Estabelecimento>> getAllEstabelecimentos();

  Future<bool> save(Estabelecimento estabelecimento);
}
