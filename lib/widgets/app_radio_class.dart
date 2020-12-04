import 'package:app_imeat/pages/cadastros/cad_usuario_cliente.dart';
import 'package:app_imeat/pages/cadastros/cad_usuario_estabelecimento.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:flutter/material.dart';

enum SingingCharacter { cliente, estabelecimento }

/// This is the stateful widget that the main application instantiates.
class AppRadioClass extends StatefulWidget {
  AppRadioClass({Key key}) : super(key: key);

  @override
  _AppRadioClass createState() => _AppRadioClass();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AppRadioClass extends State<AppRadioClass> {
  SingingCharacter _character = SingingCharacter.cliente;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "Qual usuário você deseja cadastrar?",
          style: TextStyle(
            fontSize: 18.00,
          ),
        ),
        SizedBox(
          height: 05,
        ),
        Container(
          color: Colors.orange[50],
          child: RadioListTile(
            value: SingingCharacter.cliente,
            groupValue: _character,
            title: Text("Cliente"),
            subtitle: Text(
              "Permissões: visualizar estabelecimentos e cardápios, gerenciar pedidos e configurar dados básicos da conta.",
              style: TextStyle(
                fontSize: 15.00,
              ),
            ),
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
            activeColor: Colors.orange,
            secondary: OutlineButton(
              child: Text("Avançar"),
              onPressed: () {
                if (_character == SingingCharacter.cliente) {
                  push(context, CadUsuarioCliente(), replace: true);
                }
              },
            ),
          ),
        ),
        Divider(
          thickness: 5,
          indent: 10,
          endIndent: 10,
          color: Colors.white,
        ),
        Container(
          color: Colors.orange[50],
          child: RadioListTile(
            value: SingingCharacter.estabelecimento,
            groupValue: _character,
            title: Text("Estabelecimento"),
            subtitle: Text(
              "Permissões: cadastrar cardápio, gerenciar o caixa, recepcionar e gerenciar pedidos e configurar dados básicos da conta.",
              style: TextStyle(
                fontSize: 15.00,
              ),
            ),
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
            activeColor: Colors.orange,
            secondary: OutlineButton(
              child: Text("Avançar"),
              onPressed: () {
                if (_character == SingingCharacter.estabelecimento) {
                  push(context, CadUsuarioEstabelecimento(), replace: true);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
