import 'package:emprestei/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

BannerAd anuncio;
InterstitialAd interstitialAnuncio;

void main() => runApp(AppEmprestei());

class AppEmprestei extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emprestei',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(primaryColor: Colors.blueGrey),
      home: splash()
    );
  }
}

MobileAdTargetingInfo _targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps', 'emprestei', 'uber', 'drivein'],
    contentUrl: 'https://flutter.io',
    childDirected: false, //True para filtrar para público infantil
    testDevices: <String>[],
);

void iniciarAnuncio() {
  FirebaseAdMob.instance.initialize(appId: 'ca-app-pub-7601886480500247~8527333228');

  anuncio = BannerAd(
    adUnitId: 'ca-app-pub-7601886480500247/2561718342',
    size: AdSize.smartBanner,
    targetingInfo: _targetingInfo,
    listener: (MobileAdEvent event) {
      if (event == MobileAdEvent.loaded) {
        interstitialAnuncio?.show();
      }

      if (event == MobileAdEvent.clicked || event == MobileAdEvent.closed) {
        interstitialAnuncio.dispose();
      }
    },
  );
}
