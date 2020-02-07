import 'package:emprestei/pages/splash.dart';
import 'package:flutter/material.dart';

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
