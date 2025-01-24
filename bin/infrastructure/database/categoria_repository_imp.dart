import '../../core/database/database.dart';
import '../../core/database/mapper.dart';
import '../../domain/models/categoria.dart';
import '../../domain/ports/outputs/categoria_repository.dart';

class CategoriaRepositoryImp implements CategoriaRepository {
  final Database _database;

  final Mapper _mapper;

  CategoriaRepositoryImp(this._database, this._mapper);

  @override
  Future<List<Categoria>> getCategorias() async {
    final String _sql = ' SELECT nome, descricao FROM tb_categorias;';

    var result = await _database.query(_sql);

    List<Categoria> categoria = result
        .map((r) => _mapper.toDomain(r.fields))
        .toList()
        .cast<Categoria>();

    return categoria;
  }

  @override
  Categoria getCategoriaById(int id) {
    // TODO: implement getCategoriaById
    throw UnimplementedError();
  }

  @override
  Future<bool> saveCategoria(Categoria categoria) {
    // TODO: implement saveCategoria
    throw UnimplementedError();
  }
}
