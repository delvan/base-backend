class User {
  final String nome;
  final String sobreNome;
  final DateTime dtNasc;
  final String documento;
  final String email;
  final String cidade;
  final String status;

  User(
    this.nome,
    this.sobreNome,
    this.dtNasc,
    this.documento,
    this.email,
    this.cidade,
    this.status,
  );

  @override
  String toString() {
    return 'User(nome: $nome, sobreNome: $sobreNome, dtNasc: $dtNasc, documento: $documento, email: $email, cidade: $cidade, status: $status)';
  }
}
