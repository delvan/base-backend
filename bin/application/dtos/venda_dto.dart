import '../../domain/models/venda.dart';
import 'produto_dto.dart';

class VendaDto extends Venda {
  final int id;

  VendaDto(
    super.status,
    super.dtVenda,
    super.user,
    super.produto, [
    this.id = 0,
  ]);

//TODO: refatorar aqui
  static Map toMap(Venda venda) => {
        'statusVenda': venda.status,
        'data venda': venda.dtVenda.toIso8601String(),
        'comprador': {
          'nome comprador': venda.user.nome,
          'sobrenome comprador': venda.user.sobreNome,
          'data nascimento': venda.user.dtNasc.toIso8601String(),
          'documento identificacao': venda.user.documento,
          'email comprador': venda.user.cidade,
          'status comprador': venda.user.status,
        },
        'produto': ProdutoDto.toMap(venda.produto)
      };
}
