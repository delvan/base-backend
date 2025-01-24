import '../../models/produto.dart';

abstract class ProdutoService {
  Future<List<Produto>> getAllProdutos();

  Future<bool> save(Produto produto);
}
