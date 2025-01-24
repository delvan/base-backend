import '../../models/categoria.dart';

abstract class CategoriaRepository {
  Future<List<Categoria>> getCategorias();

  Future<bool> saveCategoria(Categoria categoria);

  Categoria getCategoriaById(int id);
}
