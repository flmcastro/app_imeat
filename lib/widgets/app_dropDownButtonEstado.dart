import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class AppDropDownButonEstado extends StatefulWidget {
  AppDropDownButonEstado({Key key}) : super(key: key);

  @override
  _AppDropDownButonEstado createState() => _AppDropDownButonEstado();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AppDropDownButonEstado extends State<AppDropDownButonEstado> {
  String dropdownValue = 'Selecione um estado';
  FocusNode focusNode;
  FocusNode nextFocus;

  /*Construtor*/
  _AppDropDownButonEstado({
    this.focusNode,
    this.nextFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 50,
      width: 50,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          border: new Border.all(color: Colors.grey)),
      child: _dropDown(),
    );
  }

  _dropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      focusNode: focusNode,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
        color: Colors.grey,
        fontFamily: 'Roboto',
        fontSize: 18,
      ),
      underline: Container(
        height: 0,
        //color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Selecione um estado',
        'Acre (AC)',
        'Alagoas (AL)',
        'Amapá (AP)',
        'Amazonas (AM)',
        'Bahia (BA)',
        'Ceará (CE)',
        'Distrito Federal (DF)',
        'Espírito Santo (ES)',
        'Goiás (GO)',
        'Maranhão (MA)',
        'Mato Grosso (MT)',
        'Mato Grosso do Sul (MS)',
        'Minas Gerais (MG)',
        'Pará (PA)',
        'Paraíba (PB)',
        'Paraná (PR)',
        'Pernambuco (PE)',
        'Piauí (PI)',
        'Rio de Janeiro (RJ)',
        'Rio Grande do Norte (RN)',
        'Rio Grande do Sul (RS)',
        'Rondônia (RO)',
        'Roraima (RR)',
        'Santa Catarina (SC)',
        'São Paulo (SP)',
        'Sergipe (SE)',
        'Tocantis (TO)'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
