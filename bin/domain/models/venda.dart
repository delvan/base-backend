import 'produto.dart';
import 'user.dart';

class Venda {
  final String status;
  final DateTime dtVernda;
  final User user;
  final Produto produto;

  Venda(
    this.status,
    this.dtVernda,
    this.user,
    this.produto,
  );
}
