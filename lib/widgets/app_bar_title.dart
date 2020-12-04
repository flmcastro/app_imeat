/*Widget responsável por estilizar a propriedade 'title' do AppBar*/
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  String titulo;

  /*Construtor*/
  AppBarTitle(this.titulo);

  Widget build(BuildContext context) {
    return Center(
      child: Text(
        titulo,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
