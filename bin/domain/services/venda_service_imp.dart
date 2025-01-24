import '../models/venda.dart';
import '../ports/inputs/venda_service.dart';
import '../ports/outputs/venda_repository.dart';

class VendaServiceImp implements VendaService {
  final VendaRepository _vendaRepository;

  VendaServiceImp(this._vendaRepository);

  @override
  Future<List<Venda>> getAllVendas() {
    return _vendaRepository.getVendas();
  }

  @override
  Future<bool> save(Venda venda) {
    return _vendaRepository.saveUser(venda);
  }
}
