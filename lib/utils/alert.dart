/*Widget responsável por alertas a serem utilizados na aplicação!*/
import 'package:app_imeat/utils/nav.dart';
import 'package:flutter/material.dart';

alert(BuildContext context, String msg, {bool redirecionar = false, Widget page, replacement = false}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("IMEAT"),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                if(redirecionar){
                  push(context, page, replace: replacement);
                } else{
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      );
    },
  );
}
