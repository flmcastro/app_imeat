import 'dart:convert';
/*Realizo a importação da lib e declaro a variável http a qual utilizarei*/
import 'package:app_imeat/pages/login/cliente.dart';
import 'package:app_imeat/pages/api_response.dart';
import 'package:http/http.dart' as http;

/*CLASSE: cad_usuario_cliente_api*/
class CadUsuarioClienteApi {
  static Future<ApiResponse<Cliente>> SalvarCliente(
      String nome,
      String sobrenome,
      String rua,
      String bairro,
      String numero,
      String cidade,
      String estado,
      String complemento,
      String cep,
      String email,
      String senha,
      String tipoUsuario) async {
    try {
      /*Parâmetros da nossa API*/
      var url = 'https://imeat-homologacao.herokuapp.com/api/cliente';

      Map params = {
        'nome': nome,
        'sobrenome': sobrenome,
        'rua': rua,
        'bairro': bairro,
        'numero': numero,
        'cidade': cidade,
        'estado': estado,
        'complemento': complemento,
        'cep': cep,
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
      print(
          'Response status: ${response.statusCode}'); /*Response status é o código de retorno da solicitação a minha API*/
      print(
          'Response body: ${response.body}'); /*Response body aborda o corpo esperado da minha requisição à minha API.*/

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        return ApiResponse.ok();
      }

      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro ao inserir o cliente $error > $exception");

      return ApiResponse.error(
          "Não foi possível realizar o cadastro do cliente!");
    }
  }
}
