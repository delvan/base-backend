import '../../models/venda.dart';

abstract class VendaService {
  Future<List<Venda>> getAllVendas();

  Future<bool> save(Venda venda);
}
