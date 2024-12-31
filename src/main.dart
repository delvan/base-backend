import 'application/web/estabelecimento_controller.dart';
import 'domain/port/input/estabelecimento_service.dart';
import 'domain/port/output/estabelecimento_repository.dart';
import 'domain/services/estabelecimento_service_imp.dart';
import 'infrastructure/inMemory/estabelecimento_mapper.dart';
import 'infrastructure/inMemory/estabelecimento_repository_imp.dart';

void main(List<String> args) {
  EstabelecimentoRepository _repository =
      EstabelecimentoRepositoryImp(EstabelecimentoMapper());

  EstabelecimentoService _service = EstabelecimentoServiceImp(_repository);

  //Precisa de uma porta de serviço
  EstabelecimentoController _controller = EstabelecimentoController(_service);

  _controller.getAll();
}
