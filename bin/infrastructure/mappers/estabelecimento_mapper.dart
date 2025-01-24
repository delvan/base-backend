import '../../core/database/mapper.dart';
import '../../domain/models/estabelecimento.dart';
import '../../domain/models/user.dart';

class EstabelecimentoMapper implements Mapper<Estabelecimento> {
  @override
  Estabelecimento toDomain(Map map) => Estabelecimento(
        map['nome'],
        map['cnpj'],
        map['telefone'],
        map['descricao'],
        map['imagemUrl'],
        map['latitude'],
        map['longitude'],
        map['endereco'],
        map['enderecoNumero'],
        map['enderecoOpcional'],
        map['status'],
        User(
          map['nome'],
          map['sobrenome'],
          map['dtNasc'],
          map['documento'],
          map['email'],
          map['cidade'],
          map['status'],
        ),
      );
}
