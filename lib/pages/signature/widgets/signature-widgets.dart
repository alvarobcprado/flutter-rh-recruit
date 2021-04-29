import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';
import 'package:signature/signature.dart';

Widget buildSignatureCandidateInfo() {
  return Row(
    children: [
      CircleAvatar(
        child: Icon(Icons.person),
      ),
      SizedBox(width: 10),
      Text(
        "Candidato XX",
        style: AppTextStyles.heading17,
      ),
    ],
  );
}

Widget buildSignatureField(
    BuildContext context, SignatureController _controller) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.signatureBackground,
    ),
    child: Signature(
      controller: _controller,
      height: MediaQuery.of(context).size.height - 250,
      backgroundColor: Colors.transparent,
    ),
  );
}

Widget buildSignatureBtn(
    BuildContext context, SignatureController _controller) {
  return Expanded(
    child: Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              _controller.clear();
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(15),
            ),
            //color: Colors.red,
            //textColor: Colors.white,
            child: Text(
              'Apagar',
              style: AppTextStyles.buttom,
            ),
          ),
          SizedBox(width: 20),
          TextButton(
            onPressed: () async {
              var data = await _controller.toPngBytes();
              Navigator.pop(context, data);
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primary,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(15),
            ),
            //color: Theme.of(context).primaryColor,
            //textColor: Colors.white,
            child: Text(
              'Concluir',
              style: AppTextStyles.buttom,
            ),
          ),
        ],
      ),
    ),
  );
}
