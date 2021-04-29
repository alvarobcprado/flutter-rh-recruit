import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'package:rhrecruit/pages/home/widgets/home-widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controladores das caixas de entrada de texto
  final _usnCtrl = TextEditingController();
  final _pswdCtrl = TextEditingController();

  /// Verifica se as caixas de entrada de texto estão vazias
  void verifyLogin() {
    // Se alguma estiver vazia mostra uma caixa de diálogo
    if (_usnCtrl.text.isEmpty || _pswdCtrl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Login inválido'),
          content: Text('Login não permitido com campos vazios'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('FECHAR'),
            ),
          ],
        ),
      );

      // Se ambas possuirem texto navega para a página de candidatos
    } else {
      Navigator.pushNamed(context, '/candidates');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: <Widget>[
            SizedBox(height: 50),
            Column(
              children: <Widget>[
                Image.asset(
                  "assets/logo.png",
                  height: 84,
                ),
                SizedBox(height: 49),
                LoginInput(label: 'E-mail', ctrl: _usnCtrl, obscured: false),
                SizedBox(height: 31.0),
                LoginInput(label: 'Senha', ctrl: _pswdCtrl, obscured: true),
                buildForgotPswBtn(),
                SizedBox(height: 64),
                buildLoginBtn(context, verifyLogin),
                SizedBox(height: 30),
                Text(
                  "or",
                  style: AppTextStyles.bodyLightGrey,
                ),
                SizedBox(height: 30),
                buildSocialBtnRow(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
