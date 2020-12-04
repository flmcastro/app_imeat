import 'package:app_imeat/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(IMeatApp());

//Widget principal
class IMeatApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMeat - Plataforma de gerenciamento de pedidos',
      theme: ThemeData(primaryColor: Colors.orange),
      home: LoginPage(),
    );
  }
}
