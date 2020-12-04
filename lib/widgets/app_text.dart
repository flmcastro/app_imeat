/*Qual o motivo de se utilizar um Widget:
> A principal vantagem é que podemos utilizá-lo em outras áreas de nossa aplicação, príncipio da reusabilidade.
*/
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType KeyboardType;
  TextInputAction textInputAction;
  FocusNode focusNode;
  FocusNode nextFocus;
  Icon icon;

  /*Construtor*/
  AppText(
    this.label,
    this.hint, {
    /*Apenas o label e o hint são obrigatórios - Pós chave, atributos opcionais.*/
    this.password = false,
    this.controller,
    this.validator,
    this.KeyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
    this.icon,
  });

  Widget build(BuildContext context) {
    /*TIP: {} no parâmetro, indica opcional. Nesse caso 'password' é opcional.*/
    return TextFormField(
      /*Para leitura do dado digitado*/
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: KeyboardType,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 12.0),
          child: icon,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
    );
  }
}
