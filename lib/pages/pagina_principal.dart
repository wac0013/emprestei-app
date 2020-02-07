
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaginaPrincipal extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return PaginaPrincipalState('Principal');
  }
}

class PaginaPrincipalState extends State<PaginaPrincipal> {
  PaginaPrincipalState(this.titulo);
  String titulo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titulo),
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'teste',
          onPressed: () {
            Scaffold.of(this.context).openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(),
            ListTile()
          ],
        ),
      ),
      body: Center(),
      backgroundColor: Colors.white70,
    );
  }
  
}
