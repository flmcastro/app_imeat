import 'package:app_imeat/utils/nav.dart';
import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:app_imeat/widgets/app_radio_class.dart';
import 'package:app_imeat/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class SelecaoCadastroPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle("IMEAT - Seleção do tipo de usuário"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            push(context, LoginPage(), replace: true);
          },
        ),
      ),
      body: _body(),
    );
  }

  /*Corpo*/
  _body() {
    return Form(
        key: _formKey,
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: ListView(
              children: <Widget>[
                AppRadioClass(),
              ],
            )));
  }
}
