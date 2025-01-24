import '../../domain/models/estabelecimento.dart';

class EstabelecimentoDto extends Estabelecimento {
  final int? id;

  EstabelecimentoDto(
    super.nome,
    super.cnpj,
    super.telefone,
    super.descricao,
    super.imageUrl,
    super.latitude,
    super.longitude,
    super.endereco,
    super.enderecoNumero,
    super.complemento,
    super.status,
    super.proprietario, [
    this.id = 0,
  ]);

//TODO: refatorar aqui
  static Map toMap(Estabelecimento estabelecimento) => {
        'estabelecimentoNome': estabelecimento.nome,
        'estabelecimentocnpj': estabelecimento.cnpj,
        'estabelecimentoTelefone': estabelecimento.telefone,
        'estabelecimentoDescricao': estabelecimento.descricao,
        'estabelecimentoImagemUrl': estabelecimento.imageUrl,
        'estabelecimentoLatitude': estabelecimento.latitude,
        'estabelecimentoLongitude': estabelecimento.longitude,
        'estabelecimentoEndereco': estabelecimento.endereco,
        'estabelecimentoEnderecoNumero': estabelecimento.enderecoNumero,
        'estabelecimentoComplemento': estabelecimento.complemento,
        'proprietario': {
          'proprietarioNome': estabelecimento.proprietario.nome,
          'proprietarioSobrenome': estabelecimento.proprietario.sobreNome,
          'proprietarioDtNasc':
              estabelecimento.proprietario.dtNasc.toIso8601String(),
          'proprietarioDocumento': estabelecimento.proprietario.documento,
          'proprietarioEmail': estabelecimento.proprietario.email,
          'proprietarioCidade': estabelecimento.proprietario.cidade,
          'proprietarioStatus': estabelecimento.proprietario.status
        }
      };

  static EstabelecimentoDto fromRequest(Map map) => EstabelecimentoDto(
        map['nome'],
        map['cnpj'],
        map['telefone'],
        map['descricao'],
        map['imageUrl'],
        map['latitude'],
        map['longitude'],
        map['endreco'],
        map['enderecoNumero'],
        map['complemento'],
        map['status'],
        map['proprietario'],
      );
}
