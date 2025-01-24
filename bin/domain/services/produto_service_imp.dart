import '../models/produto.dart';
import '../ports/inputs/produto_service.dart';
import '../ports/outputs/produto_repository.dart';

class ProdutoServiceImp implements ProdutoService {
  final ProdutoRepository _produtoRepository;

  ProdutoServiceImp(this._produtoRepository);

  @override
  Future<List<Produto>> getAllProdutos() {
    return _produtoRepository.getProdutos();
  }

  @override
  Future<bool> save(Produto produto) {
    return _produtoRepository.saveProduto(produto);
  }
}
