import 'categoria.dart';
import 'estabelecimento.dart';

class Produto {
  final String nome;
  final String descricao;
  final double valor;
  final String status;
  final Estabelecimento estabelecimento;
  final Categoria categoria;

  Produto(
    this.nome,
    this.descricao,
    this.valor,
    this.status,
    this.estabelecimento,
    this.categoria,
  );

  @override
  String toString() {
    return 'Produto(nome: $nome, descricao: $descricao, valor: $valor, status: $status, estabelecimento: $estabelecimento, categoria: $categoria)';
  }
}
