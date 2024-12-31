import '../../domain/model/estabelecimento.dart';
import '../../domain/port/output/estabelecimento_repository.dart';
import 'estabelecimento_mapper.dart';

class EstabelecimentoRepositoryImp implements EstabelecimentoRepository {
  final EstabelecimentoMapper _estabelecimentoMapper;

  EstabelecimentoRepositoryImp(this._estabelecimentoMapper);

  List<Map> fakeDB = [
    {'nome': 'Estabelecimento XPTO', 'cnpj': '1234456789965'},
    {'nome': 'Estabelecimento DOIS', 'cnpj': '3423423423442'}
  ];

  @override
  List<Estabelecimento> getLisEstabelecimentos() {
    // trata todas chamadas ao mundo externo relacionda a infra
    return fakeDB.map((e) => _estabelecimentoMapper.toDomain(e)).toList();
  }
}
