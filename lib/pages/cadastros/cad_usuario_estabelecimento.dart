import 'package:app_imeat/pages/api_response.dart';
import 'package:app_imeat/pages/cadastros/cad_usuario_estabelecimento_api.dart';
import 'package:app_imeat/pages/login/login_page.dart';
import 'package:app_imeat/pages/login/selecao_cadastro_page.dart';
import 'package:app_imeat/utils/alert.dart';
import 'package:app_imeat/utils/nav.dart';
import 'package:app_imeat/widgets/app_bar_title.dart';
import 'package:app_imeat/widgets/app_button.dart';
import 'package:app_imeat/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadUsuarioEstabelecimento extends StatefulWidget {
  _CadUsuarioEstabelecimento createState() => _CadUsuarioEstabelecimento();
}

class _CadUsuarioEstabelecimento extends State<CadUsuarioEstabelecimento> {
  List<ListItem> _dropdownItems = [
    ListItem("0", "Selecione um estado"),
    ListItem("AC", "Acre"),
    ListItem("AL", "Alagoas"),
    ListItem("AP", "Amapá"),
    ListItem("AM", "Amazonas"),
    ListItem("BA", "Bahia"),
    ListItem("CE", "Ceará"),
    ListItem("DF", "Distrito Federal"),
    ListItem("ES", "Espírito Santo"),
    ListItem("GO", "Goiás"),
    ListItem("MA", "Maranhão"),
    ListItem("MT", "Mato Grosso"),
    ListItem("MS", "Mato Grosso do Sul"),
    ListItem("MG", "Minas Gerais"),
    ListItem("PA", "Pará"),
    ListItem("PB", "Paraíba"),
    ListItem("PR", "Paraná"),
    ListItem("PE", "Pernambuco"),
    ListItem("PI", "Piauí"),
    ListItem("RJ", "Rio de Janeiro"),
    ListItem("RN", "Rio Grande do Norte"),
    ListItem("RS", "Rio Grande do Sul"),
    ListItem("RO", "Rondônia"),
    ListItem("RR", "Roraima"),
    ListItem("SC", "Santa Catarina"),
    ListItem("SP", "São Paulo"),
    ListItem("SE", "Sergipe"),
    ListItem("TO", "Tocantins")
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

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  bool _showProgress = false;

  /*Aux da senha*/
  String senha;

  /*Declaração dos controllers*/
  final _tNomeRestaurante = TextEditingController();
  final _tCNPJ = TextEditingController();
  final _tRua = TextEditingController();
  final _tBairro = TextEditingController();
  final _tNumero = TextEditingController();
  final _tCidade = TextEditingController();
  final _tComplemento = TextEditingController();
  final _tCEP = TextEditingController();
  final _tUsuario = TextEditingController();
  final _tSenha = TextEditingController();
  final _tConfirmacaoSenha = TextEditingController();

  final _focusCNPJ = FocusNode();
  final _focusRua = FocusNode();
  final _focusBairro = FocusNode();
  final _focusNumero = FocusNode();
  final _focusCidade = FocusNode();
  final _focusComplemento = FocusNode();
  final _focusCEP = FocusNode();
  final _focusUsuario = FocusNode();
  final _focusSenha = FocusNode();
  final _focusConfirmacaoSenha = FocusNode();

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: AppBarTitle("IMEAT - Cadastro de estabelecimento"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            push(context, SelecaoCadastroPage(), replace: true);
          },
        ),
      ),
      body: _body(),
    );
  }

  /*Corpo do formulário*/
  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        /*Início form de cadastro de estabelecimento*/
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            /*Dados básicos
            Campo: Nome do restaurante (obrigatório)
            */
            AppText(
              "Nome do restaurante:",
              "Exemplo: Mister Lanches",
              controller: _tNomeRestaurante,
              validator: _validateNomeRestaurante,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusCNPJ,
              icon: Icon(Icons.local_dining),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: CNPJ (obrigatório)*/
            AppText(
              "CNPJ:",
              "Exemplo: 99.999.999/9999-99",
              controller: _tCNPJ,
              validator: _validateCNPJ,
              KeyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              nextFocus: _focusRua,
              focusNode: _focusCNPJ,
              icon: Icon(Icons.badge),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Rua (obrigatório)*/
            AppText(
              "Rua:",
              "Exemplo: Rua 11",
              controller: _tRua,
              validator: _validateRua,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNode: _focusRua,
              nextFocus: _focusBairro,
              icon: Icon(Icons.house),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Bairro (obrigatório)*/
            AppText(
              "Bairro:",
              "Exemplo: Jardim 11",
              controller: _tBairro,
              validator: _validateBairro,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusNumero,
              focusNode: _focusBairro,
              icon: Icon(Icons.house),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Número (obrigatório)*/
            AppText(
              "Número:",
              "Exemplo: 11",
              controller: _tNumero,
              validator: _validateNumero,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusCidade,
              focusNode: _focusNumero,
              icon: Icon(Icons.house),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Cidade (obrigatório)*/
            AppText(
              "Cidade:",
              "Exemplo: São Paulo",
              controller: _tCidade,
              validator: _validateCidade,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusComplemento,
              focusNode: _focusCidade,
              icon: Icon(Icons.location_city),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Estado (obrigatório)*/
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
              height: 10,
            ),
            /*Campo: Complemento*/
            AppText(
              "Complemento:",
              "Exemplo: Próximo ao centro",
              controller: _tComplemento,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusCEP,
              focusNode: _focusComplemento,
              icon: Icon(Icons.article_outlined),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: CEP (obrigatório)*/
            AppText(
              "CEP:",
              "00000-000",
              controller: _tCEP,
              validator: _validateCEP,
              KeyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              nextFocus: _focusUsuario,
              focusNode: _focusCEP,
              icon: Icon(Icons.location_on),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Usuário (obrigatório)*/
            AppText(
              "Usuário:",
              "Exemplo: darthVader@123.com",
              controller: _tUsuario,
              validator: _validateUsuario,
              KeyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              nextFocus: _focusSenha,
              focusNode: _focusUsuario,
              icon: Icon(Icons.email),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Senha (obrigatório)*/
            AppText(
              "Senha:",
              "Exemplo: estreladamorte123",
              password: true,
              controller: _tSenha,
              validator: _validateSenha,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              nextFocus: _focusConfirmacaoSenha,
              focusNode: _focusSenha,
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 10,
            ),
            /*Campo: Confirme sua senha (obrigatório)*/
            AppText(
              "Confirme sua senha:",
              "Exemplo: estreladamorte123",
              password: true,
              controller: _tConfirmacaoSenha,
              validator: _validateConfirmacaoSenha,
              KeyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              focusNode: _focusConfirmacaoSenha,
              icon: Icon(Icons.lock),
            ),
            SizedBox(
              height: 10,
            ),
            _showProgress
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : AppButton(
                    "Salvar",
                    onPressed: _onClickSalvar,
                    color: Colors.blue,
                  ),
          ],
        ),
      ),
    );
  }

  void _onClickSalvar() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String nomeRestaurante = _tNomeRestaurante.text;
    String cnpj = _tCNPJ.text;
    String rua = _tRua.text;
    String bairro = _tBairro.text;
    String numero = _tNumero.text;
    String cidade = _tCidade.text;
    String estado;
    String complemento = _tComplemento.text;
    String cep = _tCEP.text;
    String email = _tUsuario.text;
    String senha = _tSenha.text;
    String tipoUsuario = 'E';

    if (_selectedItem.value != "0") {
      estado = _selectedItem.value;
    } else {
      alert(context, "Selecione um estado!");
      return;
    }

    setState(() {
      _showProgress = true;
    });

    ApiResponse response =
        await CadUsuarioEstabelecimentoApi.SalvarEstabelecimento(
      nomeRestaurante,
      rua,
      bairro,
      numero,
      cidade,
      estado,
      complemento,
      cep,
      cnpj,
      email,
      senha,
      tipoUsuario,
    );

    setState(() {
      _showProgress = false;
    });

    if (response.statusSolicitacao) {
      if (response.msg != null) {
        alert(context, response.msg,
            redirecionar: true, page: LoginPage(), replacement: true);
      } else {
        alert(context, "Usuário cadastrado com sucesso!",
            redirecionar: true, page: LoginPage(), replacement: true);
      }
    } else {
      alert(context, "Não foi possível realizar o cadastro do usuário!");
    }
  }

  /*Métodos de validação*/
  String _validateNomeRestaurante(String text) {
    if (text.isEmpty) {
      return "O campo nome do restaurante é obrigatório!";
    }
    return null;
  }

  String _validateCNPJ(String text) {
    if (text.isEmpty) {
      return "O campo CNPJ é obrigatório!";
    }
    return null;
  }

  String _validateRua(String text) {
    if (text.isEmpty) {
      return "O campo rua é obrigatório!";
    }
    return null;
  }

  String _validateBairro(String text) {
    if (text.isEmpty) {
      return "O campo bairro é obrigatório!";
    }
    return null;
  }

  String _validateNumero(String text) {
    if (text.isEmpty) {
      return "O campo número é obrigatório!";
    }
    return null;
  }

  String _validateCidade(String text) {
    if (text.isEmpty) {
      return "O campo cidade é obrigatório!";
    }
    return null;
  }

  String _validateCEP(String text) {
    if (text.isEmpty) {
      return "O campo CEP é obrigatório!";
    }
    return null;
  }

  String _validateUsuario(String text) {
    if (text.isEmpty) {
      return "O campo usuário é obrigatório!";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "O campo senha é obrigatório!";
    }
    senha = _tSenha.text;
    return null;
  }

  String _validateConfirmacaoSenha(String text) {
    if (text.isEmpty) {
      return "O campo confirme sua senha é obrigatório!";
    } else if (text != senha) {
      return "As senhas digitadas não são iguais!";
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
