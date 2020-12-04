import 'package:app_imeat/pages/home_page.dart';
import 'package:app_imeat/pages/restaurantes/cardapio.dart';
import 'package:app_imeat/pages/restaurantes/cardapio_api.dart';
import 'package:app_imeat/pages/restaurantes/restaurantes.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class RestaurantesPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Restaurantes restaurantes;
  RestaurantesPage(this.restaurantes);

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: AppBarTitle(restaurantes.nome),
          /*Nesta área em específico, realizo a customização do ícone do menu e de sua cor.*/
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              push(context, HomePage(), replace: true);
            },
          ),
        ),
        body: _body());
  }

  _body() {
    Future<List<Cardapio>> future = CardapioApi.getCardapio(restaurantes.id);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            "O estabelecimento não possui cardápio cadastrado!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<Cardapio> cardapio = snapshot.data;
        return _listView(cardapio);
      },
    );
  }

  Container _listView(List<Cardapio> cardapio) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cardapio != null ? cardapio.length : 0,
          itemBuilder: (context, index) {
            Cardapio c = cardapio[index];

            /*return ListTile(
            leading: Image.network(
                "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Porsche_Panamera.png"),
            title: Text(
              r.nome,
              style: TextStyle(fontSize: 22),
            ),
          );*/

            return Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: ImageIcon(
                          AssetImage('assets/prato.png'),
                          size: 100,
                        ),
                      ),
                      Text(
                        c.nome,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.orange,
                        ),
                      ),
                      Text("Categoria:" + c.categoria,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Ingredientes:" + c.ingredientes,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      Text("Valor:" + c.valor.toString(),
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      /*ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                                child: const Text('CARDÁPIO'),
                                onPressed: () => _onClickRestaurante(r))
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ));
          }),
    );
  }
}
