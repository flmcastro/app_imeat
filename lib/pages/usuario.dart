class Usuario {
  /*Campos devem estar de acordo com o retorno da API*/
  String login;
  String nome;
  String token;

  /*Construtor da classe*/
  Usuario(Map<String, dynamic> map) {
    nome = map["nome"];
    login = map["email"];
    token = map["token"];
  }

  String toString() {
    return 'Usuario{login: $login, nome: $nome, token: $token}';
  }
}
