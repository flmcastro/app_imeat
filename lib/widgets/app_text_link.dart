/*widget: app_text_link
o que é.: esse componente será responsável por redirecionar o usuário às áreas responsáveis da aplicação
pela GestureDetector, que nada mais é que um identificador de ação no formulário.
*/
import 'package:app_imeat/pages/home_page.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:flutter/material.dart';

class AppTextLink extends StatelessWidget {
  String text;
  Widget page;
  bool replacement;

  /*Construtor*/
  AppTextLink(this.text, {this.page, this.replacement = false});

  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
      onTap: () {
        push(context, page, replace: replacement);
      },
    );
  }
}
