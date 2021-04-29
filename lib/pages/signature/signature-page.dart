import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
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

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              buildSignatureCandidateInfo(),
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
