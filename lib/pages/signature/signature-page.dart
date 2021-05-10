import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'package:rhrecruit/data/candidate-data.dart';
import 'package:rhrecruit/pages/signature/widgets/signature-widgets.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  /// Cria o controlador da área de assinatura
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 4,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
  );

  ///Captura os argumentos enviados da tela anterior
  ///e constrói a visualização da área de assinatura
  @override
  Widget build(BuildContext context) {
    Candidate candidate =
        ModalRoute.of(context).settings.arguments as Candidate;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campo de Assinatura',
          style: AppTextStyles.title,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              buildSignatureCandidateInfo(candidate),
              SizedBox(height: 10),
              buildSignatureField(context, _controller),
              buildSignatureBtn(context, _controller),
            ],
          ),
        ),
      ),
    );
  }
}
