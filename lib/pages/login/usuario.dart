import 'package:app_imeat/utils/prefs.dart';
import 'dart:convert' as convert;

class Usuario {
  /*Campos devem estar de acordo com o retorno da API*/
  String idUsuario;
  String login;
  String token;
  String senha;
  String tipoUsuario;

  /*Construtor da classe
  Usuario(Map<String, dynamic> map) {
    idUsuario = map["id"];
    login = map["email"];
    token = map["token"];
    senha = map["senha"];
    tipoUsuario = map["tipoUsuario"];
  }*/
  Usuario({
    this.idUsuario,
    this.login,
    this.token,
    this.senha,
    this.tipoUsuario,
  });

  Usuario.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id'];
    login = json['email'];
    token = json['token'];
    senha = json['senha'];
    tipoUsuario = json['tipoUsuario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idUsuario;
    data['email'] = this.login;
    data['token'] = this.token;
    data['senha'] = this.senha;
    data['tipoUsuario'] = this.tipoUsuario;
    return data;
  }

  String toString() {
    return 'Usuario{idUsuario: $idUsuario, login: $login, token: $token, senha:$senha, tipoUsuario: $tipoUsuario}';
  }

  void save() {
    Map map = toJson();

    String json = convert.json.encode(map);

    Prefs.setString("user.prefs", json);
  }

  static Future<Usuario> get() async {
    String json = await Prefs.getString("user.prefs");
    if (json.isEmpty) {
      return null;
    }

    Map map = convert.json.decode(json);
    Usuario user = Usuario.fromJson(map);
    return user;
  }
}
