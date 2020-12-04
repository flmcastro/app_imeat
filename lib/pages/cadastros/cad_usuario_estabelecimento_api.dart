import 'dart:convert';
import 'package:app_imeat/pages/login/estabelecimento.dart';
import 'package:app_imeat/pages/api_response.dart';
import 'package:http/http.dart' as http;

/*CLASSE: cad_usuario_estabelecimento_api*/
class CadUsuarioEstabelecimentoApi {
  static Future<ApiResponse<Estabelecimento>> SalvarEstabelecimento(
      String nome,
      String rua,
      String bairro,
      String numero,
      String cidade,
      String estado,
      String complemento,
      String cep,
      String cnpj,
      String email,
      String senha,
      String tipoUsuario) async {
    try {
      var url = 'https://imeat-homologacao.herokuapp.com/api/estabelecimento';

      Map params = {
        'nome': nome,
        'rua': rua,
        'bairro': bairro,
        'numero': numero,
        'cidade': cidade,
        'estado': estado,
        'complemento': complemento,
        'cep': cep,
        'cnpj': cnpj,
        'usuario': {
          'email': email,
          'senha': senha,
          'tipoUsuario': tipoUsuario,
        }
      };

      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      String paramsJSON = json.encode(params);

      var response = await http.post(url, headers: headers, body: paramsJSON);

      print('Params: ${paramsJSON}');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse.ok();
      }

      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro ao inserir o estabelecimento $error > $exception");

      return ApiResponse.error(
          "Não foi possível realizar o cadastro do estabelecimento!");
    }
  }
}
