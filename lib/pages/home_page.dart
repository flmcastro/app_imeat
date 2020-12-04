import 'package:app_imeat/pages/restaurantes/restaurante_page.dart';
import 'package:app_imeat/pages/restaurantes/restaurantes.dart';
import 'package:app_imeat/pages/restaurantes/restaurantes_api.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:app_imeat/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: AppBarTitle("IMEAT - Home Page"),
        /*Nesta área em específico, realizo a customização do ícone do menu e de sua cor.*/
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      body: _body(),
      drawer: DrawerList(),
    );
  }

  /*Corpo*/
  _body() {
    Future<List<Restaurantes>> future = RestaurantesApi.getRestaurantes();

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            "Não foi possível buscar os estabelecimentos cadastrados!",
            style: TextStyle(
              color: Colors.red,
              fontSize: 22,
            ),
          ));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        List<Restaurantes> restaurantes = snapshot.data;
        return _listView(restaurantes);
      },
    );
  }

  Container _listView(List<Restaurantes> restaurantes) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: restaurantes != null ? restaurantes.length : 0,
          itemBuilder: (context, index) {
            Restaurantes r = restaurantes[index];

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
                          AssetImage('assets/restaurant.png'),
                          size: 60,
                        ),
                      ),
                      Text(
                        r.nome,
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          "Endereço:" +
                              r.rua +
                              "," +
                              r.numero +
                              "," +
                              r.bairro +
                              "," +
                              r.cidade +
                              "/" +
                              r.estado,
                          style: TextStyle(
                            fontSize: 17,
                          )),
                      ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                                child: const Text('CARDÁPIO'),
                                onPressed: () => _onClickRestaurante(r))
                          ],
                        ),
                      ),
                    ],
                  ),
                ));
          }),
    );
  }

  _onClickRestaurante(Restaurantes r) {
    push(context, RestaurantesPage(r));
  }
}
