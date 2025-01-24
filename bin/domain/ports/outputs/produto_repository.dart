import '../../models/produto.dart';

abstract class ProdutoRepository {
  Future<List<Produto>> getProdutos();

  Future<bool> saveProduto(Produto produto);

  Produto getProdutoById(int id);
}
