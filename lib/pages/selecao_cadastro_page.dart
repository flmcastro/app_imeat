import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:flutter/material.dart';

class SelecaoCadastroPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle("IMEAT - Cadastro de usuário"),
      ),
      body: _body(),
    );
  }

  /*Corpo*/
  _body() {
    return Container(
      color: Colors.white,
    );
  }
}
