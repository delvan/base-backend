import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/produto.dart';
import '../../domain/ports/outputs/produto_repository.dart';
import '../../application/dtos/produto_dto.dart';

class ProdutoRepositoryImp implements ProdutoRepository {
  final Database _database;

  final Mapper _mapper;

  ProdutoRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Produto>> getProdutos() async {
    final String _sql = '''
        SELECT 
          p.nome as produtoNome,
          p.descricao as produtoDescricao,
          p.valor as produtoValor,
          p.status as produtoStatus,
          c.nome as categoriaNome,
          c.descricao as categoriaDescricao,
          e.nome as estabelecimentoNome,
          e.cnpj as estabelecimentoCnpj,
          e.telefone as estabelecimentoTelefone,
          e.descricao as estabelecimentoDescricao,
          e.imagemUrl as estabelecimentoImagemUrl,
          e.latitude as estabelecimentoLatitude,
          e.longitude as estabelecimentoLongitude,
          e.endereco as estabelecimentoEndereco,
          e.enderecoNumero as estabelecimentoNumero,
          e.enderecoOpcional as estabelecimentoEnderecoOpcional,
          e.status as estabelecimentoStatus,
          u.nome as usuarioNome,
          u.sobrenome as usuarioSobrenome,
          u.dtNasc as usuarioDtNasc,
          u.status as usuarioStatus,
          u.documento as usuarioDocumento,
          u.email as usuarioEmail,
          u.cidade as usuarioCidade
          FROM tb_produtos p 
          INNER JOIN tb_categorias c ON c.id = p.idCategoria 
          INNER JOIN tb_estabelecimentos e ON e.id = p.idEstabelecimento
          INNER JOIN tb_usuarios u ON u.id = e.idUsuario;

    ''';

    var result = await _database.query(_sql);

    List<Produto> produtos =
        result.map((r) => _mapper.toDomain(r.fields)).toList().cast<Produto>();

    return produtos;
  }

  @override
  Future<bool> saveProduto(Produto produto) async {
    produto as ProdutoDto;
    final String _sql = '''
        INSERT INTO tb_produtos
         (nome, descricao, valor, status, idCategoria, idEstabelecimento)
        VALUES
         (?,?,?,?,?,?);

''';

    var result = await _database.query(_sql, [
      produto.nome,
      produto.descricao,
      produto.valor,
      produto.status,
      produto.categoria,
      produto.estabelecimento,
    ]);

    return result.affectedRows > 0;
  }

  @override
  Produto getProdutoById(int id) {
    // TODO: implement getProdutoById
    throw UnimplementedError();
  }
}
