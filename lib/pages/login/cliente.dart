import 'package:app_imeat/pages/login/usuario.dart';
import 'dart:convert' as convert;

import 'package:app_imeat/utils/prefs.dart';

class Cliente {
  /*Campos devem estar de acordo com o retorno da API*/
  String id;
  String nome;
  String sobrenome;
  String rua;
  String bairro;
  String numero;
  String cidade;
  String estado;
  String complemento;
  String cep;

  Usuario usuario;

  Cliente(Map<String, dynamic> map) {
    id = map["id"];
    nome = map["nome"];
    sobrenome = map["sobrenome"];
    rua = map["rua"];
    bairro = map["bairro"];
    numero = map["numero"];
    cidade = map["cidade"];
    estado = map["estado"];
    complemento = map["complemento"];
    cep = map["cep"];
    /*usuario.idUsuario = map["id"];
    usuario.login = map["email"];
    usuario.token = map["token"];
    usuario.senha = map["senha"];
    usuario.tipoUsuario = map["tipoUsuario"];*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['sobrenome'] = this.sobrenome;
    data['rua'] = this.rua;
    data['bairro'] = this.bairro;
    data['numero'] = this.numero;
    data['cidade'] = this.cidade;
    data['estado'] = this.estado;
    data['complemento'] = this.complemento;
    data['cep'] = this.cep;
    /*Usuario
    data['id'] = usuario.idUsuario;
    data['email'] = usuario.login;
    data['token'] = usuario.token;
    data['senha'] = usuario.senha;
    data['tipoUsuario'] = usuario.tipoUsuario;*/
    return data;
  }

  String toString() {
    return 'Cliente{nome: $nome, sobrenome: $sobrenome, rua: $rua, bairro: $bairro, número: $numero, cidade: $cidade, estado: $estado, complemento: $complemento, cep: $cep}';
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Cliente> get() async {
    String json = await Prefs.getString("user.prefs");

    Map map = convert.json.decode(json);
    Cliente cliente = Cliente(map);
    return cliente;
  }
}
