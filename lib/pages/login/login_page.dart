/*Página de login da aplicação.*/
import 'dart:ui';

import 'package:app_imeat/pages/api_response.dart';
import 'package:app_imeat/pages/cadastros/cad_usuario_cliente.dart';
import 'package:app_imeat/pages/home_page.dart';
import 'package:app_imeat/pages/login/login_api.dart';
import 'package:app_imeat/pages/login/selecao_cadastro_page.dart';
import 'package:app_imeat/pages/login/usuario.dart';
import 'package:app_imeat/utils/alert.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:app_imeat/widgets/app_button.dart';
import 'package:app_imeat/widgets/app_text.dart';
import 'package:app_imeat/widgets/app_text_link.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  /*Deve ser criado um controlador para cada campo de texto do form.*/
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  /*TIP: Variável criada para dar o foco no campo. Utilizada para quando ocorrer o 'Seguinte' no teclado*/
  final _focusSenha = FocusNode();

  /*Variável para controlar o estado de alternância entre Button e showProgress*/
  bool _showProgress = false;

  /*Área reservada ao DropDownButton de seleção de usuário*/
  List<ListItem> _dropdownItems = [
    ListItem("0", "Selecione um tipo de usuário"),
    ListItem("C", "Cliente"),
    ListItem("E", "Estabelecimento")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle("IMEAT - Autenticação"),
      ),
      body: _body(),
    );
  }

  /*Método do corpo da aplicação*/
  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        /*Início form de login*/
        child: ListView(
          children: <Widget>[
            AppText(
              "Usuário:",
              "Exemplo: darthVader@123.com",
              controller: _tLogin,
              validator: _validateLogin,
              KeyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
              icon: Icon(Icons.email),
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              "Senha:",
              "Exemplo: estreladamorte123",
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              focusNode: _focusSenha,
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 10,
            ),
            /*DropDownButton responsável por seleção cliente ou estabelecimento*/
            Container(
              padding: const EdgeInsetsDirectional.only(start: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                    value: _selectedItem,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            /*Através da variável _showProgress, verifica-se o que deverá ser apresentado é
            o botão (AppButton) ou o Widget de demonstração de progresso.*/
            _showProgress
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AppButton(
                    "Entrar",
                    onPressed: _onClickLogin,
                    color: Colors.blue,
                  ),

            /*TIP: SizedBox é utilizado para dar espaçamento no layout da aplicação.*/
            SizedBox(
              height: 10,
            ),
            /*Aciono os links de cadastre-se e recuperação de senha*/
            AppTextLink(
              "Não tem uma conta? Cadastre-se!",
              page: SelecaoCadastroPage(),
              replacement: true,
            ),
            SizedBox(
              height: 05,
            ),
            AppTextLink("Recuperar a senha!", page: HomePage()),
          ],
        ),
      ),
    );
  }

  _button(String text, Function onPressed) {}

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;
    String tipoUsuario;

    if (_selectedItem.value == "0") {
      alert(context, "Selecione um tipo de usuário!");
      return;
    } else {
      tipoUsuario = _selectedItem.value;
    }

    //print("Login: $login, Senha: $senha"); Utilizado apenas para teste. Apresentar o login e o usuário
    //push(context, HomePage());
    /*TIP: O setState serve para que o Flutter redesenhe a tela, ou seja, acione novamente o 
    build*/
    setState(() {
      _showProgress = true;
    });

    /*Efetuar a chamada da API*/
    ApiResponse response = await LoginApi.login(login, senha, tipoUsuario);

    if (response.statusSolicitacao) {
      push(context, HomePage(), replace: true);
    } else {
      if (response.msg != null) {
        alert(context, response.msg);
      } else {
        alert(context, "Não foi possível realizar o login!");
      }
    }

    setState(() {
      _showProgress = false;
    });
  }

  /*Validadores do formulário de login da aplicação
  Campos obrigatórios: Usuário e senha.*/
  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "O campo usuário é obrigatório!";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "O campo senha é obrigatório!";
    }
    return null;
  }

  void dispose() {
    super.dispose();
  }
}

class ListItem {
  String value;
  String name;

  ListItem(this.value, this.name);
}
