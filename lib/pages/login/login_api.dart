import 'dart:convert';
/*Realizo a importação da lib e declaro a variável http a qual utilizarei*/
import 'package:app_imeat/pages/api_response.dart';
import 'package:app_imeat/pages/login/cliente.dart';
import 'package:app_imeat/pages/login/usuario.dart';
import 'package:app_imeat/utils/prefs.dart';
import 'package:http/http.dart' as http;

/*CLASSE: login_api*/
class LoginApi {
  static Future<ApiResponse<Usuario>> login(
      String login, String senha, String tipoUsuario) async {
    try {
      /*Parâmetros da nossa API*/
      var url =
          'https://imeat-homologacao.herokuapp.com/api/usuario/login'; /*URL da nossa API*/

      Map params = {
        /*Parâmetros da API: email e senha*/
        'email': login,
        'senha': senha,
        'tipoUsuario': tipoUsuario,
      };

      Map<String, String> headers = {
        "Content-Type": "application/json",
      };

      /*A aplicação por padrão encaminha o content como sendo um URL Encoder
    sendo assim, necessita converter nosso params para JSON*/
      String paramsJSON = json.encode(params);

      var response = await http.post(url, headers: headers, body: paramsJSON);
      //var response = await http.post(url);
      //var response = await http.post(url, body: paramsJSON);

      print('Params: ${paramsJSON}');
      print(
          'Response status: ${response.statusCode}'); /*Response status é o código de retorno da solicitação a minha API*/
      print(
          'Response body: ${response.body}'); /*Response body aborda o corpo esperado da minha requisição à minha API.*/

      /*Nessa área, irei recuperar o body e tratar através do decode
    Ele será responsável por possibilitar a leitura do retorno */
      Map mapResponse = json.decode(response.body);

      /*Início do tratamento de erro
    Status code:
    >200: Autorizado;*/

      /*Se o código for 200, há o retorno do usuário!*/
      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        //final cliente = Cliente(mapResponse);

        user.save();
        //cliente.save();
        /*Testes*/
        Usuario user2 = await Usuario.get();
        print("user2: $user2");

        return ApiResponse.ok(result: user);
      }

      return ApiResponse.error(mapResponse["msg"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login!");
    }
  }
}
