import 'dart:convert';

import 'package:app_imeat/pages/restaurantes/restaurantes.dart';
import 'package:http/http.dart' as http;

class RestaurantesApi {
  static Future<List<Restaurantes>> getRestaurantes() async {
    try {
      var url =
          'https://imeat-homologacao.herokuapp.com/api/estabelecimento/lista';

      var response = await http.get(url);

      List list = json.decode(response.body);

      final restaurantes = List<Restaurantes>();

      for (Map map in list) {
        Restaurantes r = Restaurantes(map);
        restaurantes.add(r);
      }

      return restaurantes;
    } catch (error) {
      print(error);
    }
  }
}
