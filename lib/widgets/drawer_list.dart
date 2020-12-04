import 'package:app_imeat/pages/login/cliente.dart';
import 'package:app_imeat/pages/login/login_page.dart';
import 'package:app_imeat/pages/login/usuario.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Future<Cliente> futureCliente = Cliente.get();
    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: future,
              builder: (context, snapshot) {
                Usuario usuario = snapshot.data;

                return usuario != null ? _header(usuario) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.build_circle),
              title: Text("Configurações"),
              subtitle: Text("realize ajustes básicos em seu perfil..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.pageview_rounded),
              title: Text("Meus pedidos"),
              subtitle: Text("acompanhe o histórico de seus pedidos..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _header(Usuario usuario) {
    return UserAccountsDrawerHeader(
      accountName: Text("IMEAT"),
      accountEmail: Text("Menu"),
      currentAccountPicture: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqP85ZnOcRSCX3nlYdkCvSxhSuZs0bLt1He8EvGr5ne8c7mTqW"),
      ),
    );
  }

  /*Método responsável por efetuar o logout da aplicação, ou seja,
                realizar a chamada da page do login*/
  _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
