
import 'package:emprestei/pages/pagina_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

Widget splash() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blueGrey,
            Colors.blue
          ]
        ),
        navigateAfterSeconds: PaginaPrincipal(),
        loaderColor: Colors.green,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dinheiro-icon2.png"),
            fit: BoxFit.none,

          )
        ),
      )
    ],
  );
}