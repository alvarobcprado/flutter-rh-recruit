import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhrecruit/pages/home/home-page.dart';
import 'package:rhrecruit/pages/splash/widgets/splash-widgets.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Altera a cor das barras superior e inferior do android
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF193283),
        statusBarColor: Color(0xFF193283),
      ),
    );
    // Desativa a barra inferior do android
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    timeDilation = 0.7;
  }

  @override
  void dispose() {
    super.dispose();
    // Reativa a barra inferior do android
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // Retorna a velocidade normal das animações/transições
    timeDilation = 1.0;
  }

  @override
  Widget build(BuildContext context) {
    // Função assíncrona que ativa após 3 segundos
    Future.delayed(Duration(seconds: 3)).then(
      (_) {
        // Diminui a velocidade das animações/transições
        timeDilation = 6.0;
        // Desativa a página da splash e coloca a Home no lugar
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Theme.of(context).primaryColor,
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/logo2.png",
                    ),
                    SizedBox(height: 38),
                    Text(
                      "Kenoby",
                      style: GoogleFonts.righteous(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              buildBottomText(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
