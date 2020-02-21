
import 'package:emprestei/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaPrincipal extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PaginaPrincipalState('Principal');
  }
}

class PaginaPrincipalState extends State<PaginaPrincipal> {
  final GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();
  PaginaPrincipalState(this.titulo);
  String titulo;

  @override
  void initState() {
    super.initState();
    iniciarAnuncio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text(this.titulo),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'teste',
          onPressed: () {
            _scaffold.currentState.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: null
            ),
            ListTile()
          ],
        ),
      ),
      body: Center(),
      backgroundColor: Colors.white70,
    );
  }
  
}
