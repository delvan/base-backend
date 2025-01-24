import '../../models/venda.dart';

abstract class VendaRepository {
  Future<List<Venda>> getVendas();

  Future<bool> saveUser(Venda venda);

  Venda getVendaById(int id);
}
