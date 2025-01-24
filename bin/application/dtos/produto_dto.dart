import '../../domain/models/produto.dart';

class ProdutoDto extends Produto {
  final int id;

  ProdutoDto(
    super.nome,
    super.descricao,
    super.valor,
    super.status,
    super.estabelecimento,
    super.categoria, [
    this.id = 0,
  ]);

//TODO: refatorar aqui
  static Map toMap(Produto produto) => {
        'produtoNome': produto.nome,
        'produtoDescricao': produto.descricao,
        'produtoValor': produto.valor,
        'produtoStatus': produto.status,
        'estabelecimento': {
          'estabelecimentoNome': produto.estabelecimento.nome,
          'estabelecimentoCnpj': produto.estabelecimento.cnpj,
          'estabelecimentoTelefone': produto.estabelecimento.telefone,
          'estabelecimentoDescricao': produto.estabelecimento.descricao,
          'estabelecimentoImageUrl': produto.estabelecimento.imageUrl,
          'estabelecimentoLatitude': produto.estabelecimento.latitude,
          'estabelecimentoLongitude': produto.estabelecimento.longitude,
          'estabelecimentoEndereco': produto.estabelecimento.endereco,
          'estabelecimentoEnderecoNumero':
              produto.estabelecimento.enderecoNumero,
          'estabelecimentoEmdrecoComplemento':
              produto.estabelecimento.complemento,
          'proprietario': {
            'proprietarioNome': produto.estabelecimento.proprietario.nome,
            'proprietarioSobrenome':
                produto.estabelecimento.proprietario.sobreNome,
            'proprietarioDtNasc':
                produto.estabelecimento.proprietario.dtNasc.toIso8601String(),
            'proprietarioDocumento':
                produto.estabelecimento.proprietario.documento,
            'proprietarioEmail': produto.estabelecimento.proprietario.email,
            'proprietarioCidade': produto.estabelecimento.proprietario.cidade,
            'proprietarioStatus': produto.estabelecimento.proprietario.status
          }
        },
        'categoria': {
          'nome': produto.categoria.nome,
          'descricao': produto.categoria.descricao
        }
      };

  static ProdutoDto fromRequest(Map map) => ProdutoDto(
        map['nome'],
        map['descricao'],
        map['valor'],
        map['status'],
        map['estabelecimento'],
        map['categoria'],
      );
}
