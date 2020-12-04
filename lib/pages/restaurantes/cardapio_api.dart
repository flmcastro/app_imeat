import 'dart:convert';
import 'package:app_imeat/pages/restaurantes/cardapio.dart';
import 'package:http/http.dart' as http;

class CardapioApi {
  static Future<List<Cardapio>> getCardapio(String idEstabelecimento) async {
    try {
      var url =
          'https://imeat-homologacao.herokuapp.com/api/estabelecimento/cardapio/$idEstabelecimento';

      var response = await http.get(url);

      print(url);
      List list = json.decode(response.body);

      final cardapio = List<Cardapio>();

      for (Map map in list) {
        Cardapio c = Cardapio(map);
        cardapio.add(c);
      }

      return cardapio;
    } catch (error) {
      print(error);
    }
  }
}
