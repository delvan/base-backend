import '../../domain/models/categoria.dart';

class CategoriaDto extends Categoria {
  final int id;

  CategoriaDto(
    super.nome,
    super.descricao, [
    this.id = 0,
  ]);

//TODO: refatorar aqui
  static Map toMap(Categoria categoria) => {
        'nome': categoria.nome,
        'descricao': categoria.descricao,
      };

  static CategoriaDto fromRequest(Map map) =>
      CategoriaDto(map['nome'], map['descricao']);
}
