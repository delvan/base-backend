class User {
  final int id;
  final String nome;
  final String sobreNome;
  final DateTime dtNasc;
  final String documento;
  final String email;
  final String cidade;
  final String status;

  User({
    required this.id,
    required this.nome,
    required this.sobreNome,
    required this.dtNasc,
    required this.documento,
    required this.email,
    required this.cidade,
    required this.status,
  });

  @override
  String toString() {
    return 'User(id: $id, nome: $nome, sobreNome: $sobreNome, dtNasc: $dtNasc, documento: $documento, email: $email, cidade: $cidade, status: $status)';
  }
}
