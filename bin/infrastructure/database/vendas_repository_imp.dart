import '../../domain/models/venda.dart';
import '../../domain/ports/outputs/venda_repository.dart';

import '../../core/database/database.dart';
import '../../core/database/mapper.dart';

class VendasRepositoryImp implements VendaRepository {
  final Database _database;

  final Mapper _mapper;

  VendasRepositoryImp(this._database, this._mapper);

  @override
  Venda getVendaById(int id) {
    // TODO: implement getVendaById
    throw UnimplementedError();
  }

  @override
  Future<List<Venda>> getVendas() async {
    final String _sql = '''
    select 
        v.status as vendaStatus,
        v.dtCreated as dtVenda,
        u.nome as nomeUsuario,
        u.sobrenome as usuarioSobrenome,
        u.dtNasc as dtNascimento,
        u.documento as usuarioDocumento,
        u.email as usuarioEmail,
        u.cidade as usuarioCidade,
        u.status as usuarioStatus,
        p.nome as nomeProduto,
        p.descricao as descricaoProduto,
        p.valor as valorProduto,
        p.status as statusProduto,
        p.dtCreated as dtProduto,
        c.nome as nomeCategoria,
        c.descricao as descricaoCategoria,
        c.dtCreated as dtcategoria,
        e.nome as nomeEstabelecimento,
        e.cnpj as cpnjEstabelecimento,
        e.telefone as telefoneEstabelecimento,
        e.descricao as descricaoEstabelecimento,
        e.imagemUrl as imagemEstabelecimento,
        e.latitude as latitudeEstabelecimento,
        e.longitude as longitudeEstabelecimento,
        e.endereco as enderecoEstabelecimento,
        e.enderecoNumero as numeroEstabelecimento,
        e.enderecoOpcional as complementoEstabelecimento,
        e.status as statusEstabelecimento,
        e.dtCreated as dtEstabelecimento,
        
        us.nome as compradorNome,
        us.sobrenome as compradorSobrenome,
        us.dtNasc as compradorDtNascimento,
        us.documento as compradorDocumento,
        us.email as compradorEmail,
        us.cidade as compradorCidade,
        us.status as compradorStatus
        
    from tb_vendas v 
    INNER JOIN tb_usuarios u on v.idUsuario = u.id
    INNER JOIN tb_produtos p on v.idProduto = p.id
    INNER JOIN tb_categorias c on p.idCategoria = c.id
    INNER JOIN tb_estabelecimentos e on p.idEstabelecimento = e.id
    INNER JOIN tb_usuarios us on e.idUsuario = us.id;

''';

    var result = await _database.query(_sql);

    List<Venda> vendas = result
        .map((row) => _mapper.toDomain(row.fields))
        .toList()
        .cast<Venda>();

    return vendas;
  }

  @override
  Future<bool> saveUser(Venda venda) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}
