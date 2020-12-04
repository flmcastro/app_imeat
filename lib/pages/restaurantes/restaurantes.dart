class Restaurantes {
  /*Campos devem estar de acordo com o retorno da API*/
  String id;
  String nome;
  String rua;
  String bairro;
  String numero;
  String cidade;
  String estado;
  String cep;
  String cnpj;

  Restaurantes(Map<String, dynamic> map) {
    id = map["id"];
    nome = map["nome"];
    rua = map["rua"];
    bairro = map["bairro"];
    numero = map["numero"];
    cidade = map["cidade"];
    estado = map["estado"];
    cep = map["cep"];
    cnpj = map["cnpj"];
  }
}
