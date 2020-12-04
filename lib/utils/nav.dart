/*Responsável por realizar a transição das pages na aplicação*/
import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

/*TIP:
PUSH: Mantém as pages sobrepostas;
PUSHREPLACEMENT: Destrói a page*/
