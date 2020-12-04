import 'package:app_imeat/pages/login/usuario.dart';

class Estabelecimento {
  /*Campos devem estar de acordo com o retorno da API*/
  String idEstabelecimento;
  String bairro;
  String cep;
  String cidade;
  String cnpj;
  String estado;
  String nome;
  String numero;
  String rua;

  Usuario usuario;

  Estabelecimento(Map<String, dynamic> map) {
    idEstabelecimento = map["id"];
    bairro = map["bairro"];
    cep = map["cep"];
    cidade = map["cidade"];
    cnpj = map["cnpj"];
    estado = map["estado"];
    nome = map["nome"];
    numero = map["numero"];
    rua = map["rua"];
    /*usuario.idUsuario = map["id"];
    usuario.login = map["email"];
    usuario.senha = map["senha"];
    usuario.tipoUsuario = map["tipoUsuario"];*/
  }

  String toString() {
    return 'Estabelecimento{idEstabelecimento: $idEstabelecimento, bairro: $bairro, CEP: $cep, cidade: $cidade, CNPJ: $cnpj, estado: $estado, nome: $nome, número: $numero, rua: $rua)}';
  }
}
