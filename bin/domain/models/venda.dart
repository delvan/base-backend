import 'produto.dart';
import 'user.dart';

class Venda {
  final String status;
  final DateTime dtVenda;
  final User user;
  final Produto produto;

  Venda(
    this.status,
    this.dtVenda,
    this.user,
    this.produto,
  );

  @override
  String toString() {
    return 'Venda(status: $status, dtVernda: $dtVenda, user: $user, produto: $produto)';
  }
}
