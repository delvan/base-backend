import '../../core/database/mapper.dart';
import '../../domain/models/categoria.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/models/produto.dart';
import '../../domain/models/user.dart';
import '../../domain/models/venda.dart';

class VendaMapper implements Mapper {
  @override
  Venda toDomain(Map map) => Venda(
        map['vendaStatus'],
        map['dtVenda'],
        User(
          map['nomeUsuario'],
          map['usuarioSobrenome'],
          map['dtNascimento'],
          map['usuarioDocumento'],
          map['usuarioEmail'],
          map['usuarioCidade'],
          map['usuarioStatus'],
        ),
        Produto(
          map['nomeProduto'],
          map['descricaoProduto'],
          map['valorProduto'],
          map['statusProduto'],
          Estabelecimento(
            map['nomeEstabelecimento'],
            map['cpnjEstabelecimento'],
            map['telefoneEstabelecimento'],
            map['descricaoEstabelecimento'],
            map['imagemEstabelecimento'],
            map['latitudeEstabelecimento'],
            map['longitudeEstabelecimento'],
            map['enderecoEstabelecimento'],
            map['numeroEstabelecimento'],
            map['complementoEstabelecimento'],
            map['statusEstabelecimento'],
            User(
                map['compradorNome'],
                map['compradorSobrenome'],
                map['compradorDtNascimento'],
                map['compradorDocumento'],
                map['compradorEmail'],
                map['usuarioCidade'],
                map['compradorStatus']),
          ),
          Categoria(
            map['nomeCategoria'],
            map['descricaoCategoria'],
          ),
        ),
      );
}
