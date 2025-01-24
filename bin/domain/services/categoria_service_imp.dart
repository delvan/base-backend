import '../models/categoria.dart';
import '../ports/inputs/categoria_service.dart';
import '../ports/outputs/categoria_repository.dart';

class CategoriaServiceImp implements CategoriaService {
  final CategoriaRepository _categoriaRepository;

  CategoriaServiceImp(this._categoriaRepository);

  @override
  Future<List<Categoria>> getAllCategorias() {
    return _categoriaRepository.getCategorias();
  }

  @override
  Future<bool> save(Categoria categoria) {
    return _categoriaRepository.saveCategoria(categoria);
  }
}
