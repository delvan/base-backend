import '../../application/dtos/user_dto.dart';
import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/ports/outputs/estabelecimento_repository.dart';

class EstabelecimentoRepositoryImp implements EstabelecimentoRepository {
  final Database _database;

  final Mapper _mapper;

  EstabelecimentoRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Estabelecimento>> getEstabelecimentos() async {
    final String _sql = '''
        SELECT 
          e.id,
          e.nome,
          e.cnpj,
          e.telefone,
          e.descricao,
          e.imagemUrl,
          e.latitude,
          e.longitude,
          e.endereco,
          e.enderecoNumero,
          e.enderecoOpcional,
          e.status,
          u.id,
          u.nome,
          u.sobrenome,
          u.dtNasc,
          u.documento,
          u.email,
          u.cidade,
          u.status
        FROM tb_estabelecimentos e 
        INNER JOIN tb_usuarios u on u.id = e.idUsuario;

    ''';

    var result = await _database.query(_sql);

    List<Estabelecimento> estabelecimentos = result
        .map((r) => _mapper.toDomain(r.fields))
        .toList()
        .cast<Estabelecimento>();

    return estabelecimentos;
  }

  @override
  Future<bool> saveEstabelecimento(Estabelecimento estabelecimento) async {
    estabelecimento as UserDto;
    final String _sql = '''
        INSERT INTO tb_estabelecimentos
         (nome, cnpj, telefone, descricao, imageUrl, latitude, longitude, endereco, enderecoNumero, enderecoOpcional, status, idUsuario)
        VALUES
         (?,?,?,?,?,?,?,?,?,?,?,?);

''';

    var result = await _database.query(_sql, [
      estabelecimento.nome,
      estabelecimento.cnpj,
      estabelecimento.telefone,
      estabelecimento.descricao,
      estabelecimento.imageUrl,
      estabelecimento.latitude,
      estabelecimento.longitude,
      estabelecimento.endereco,
      estabelecimento.enderecoNumero,
      estabelecimento.complemento,
      estabelecimento.status,
      estabelecimento.proprietario,
    ]);

    return result.affectedRows > 0;
  }

  @override
  Estabelecimento getEstabelecimentoById(int id) {
    // TODO: implement getEstabelecimentoById
    throw UnimplementedError();
  }
}
