import 'package:flutter/material.dart';
import 'package:rhrecruit/core/core.dart';

// ignore: must_be_immutable
class LoginInput extends StatelessWidget {
  var label = '';
  var obscured = false;
  var ctrl = TextEditingController();
  LoginInput({
    @required this.label,
    @required this.ctrl,
    @required this.obscured,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        SizedBox(height: 5),
        Container(
          height: 50,
          alignment: Alignment.centerLeft,
          child: TextField(
            controller: ctrl,
            decoration: InputDecoration(
              //labelText: label,
              labelStyle: AppTextStyles.login,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
            obscureText: obscured,
          ),
        ),
      ],
    );
  }
}

Widget buildForgotPswBtn() {
  return Container(
    alignment: Alignment.centerRight,
    height: 30,
    child: TextButton(
      onPressed: () {},
      child: Text(
        'Esqueceu a senha?',
        style: AppTextStyles.forgotPassword,
      ),
    ),
  );
}

Widget buildLoginBtn(BuildContext context, Function func) {
  return Container(
    width: double.infinity,
    height: 45,
    // decoration: BoxDecoration(
    //   color: AppColors.primary,
    //   borderRadius: BorderRadius.circular(15),
    // ),
    child: TextButton(
      onPressed: func,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(AppColors.primaryLight),
        backgroundColor: MaterialStateProperty.all(AppColors.primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: Text(
        'Entrar',
        style: AppTextStyles.buttom,
      ),
    ),
  );
}

Widget buildSocialBtn(String logo) {
  return IconButton(
    icon: Image.asset(logo),
    onPressed: () {},
  );
}

Widget buildSocialBtnRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      buildSocialBtn('assets/google.png'),
      buildSocialBtn('assets/facebook.png'),
      buildSocialBtn('assets/linkedin.png'),
      buildSocialBtn('assets/twitter.png'),
    ],
  );
}
