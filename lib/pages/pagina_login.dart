import 'package:emprestei/pages/pagina_principal.dart';
import 'package:emprestei/utils/funcoes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';


final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
  print("signed in " + user.displayName);
  return user;
}

class PaginaLogin extends StatefulWidget {
  PaginaLoginState createState() => new PaginaLoginState();
}

class PaginaLoginState extends State<PaginaLogin> {
  bool _showPass = false;
  String _emailCpf = "";
  String _senha = "";

  void _changePasswordVisibility() {
    this._showPass = !this._showPass;
  }

  bool _validarLogin(String emailCpf) {
    return validaCPF(emailCpf) || validaEmail(emailCpf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/dinheiro-icon-png-1.png", height: 200),
            TextFormField(
              onChanged: (value) => _emailCpf = value,
              decoration: InputDecoration(labelText: "e-mail ou CPF"),
            ),
            TextFormField(
              key: new Key('senha'),
              onChanged: (value) => _senha = value,
              obscureText: !_showPass,
              decoration: InputDecoration(
                labelText: "senha",
                suffixIcon: IconButton(
                  icon: _showPass ? Icon(Icons.visibility) : Icon(Icons.visibility_off), 
                  onPressed: (){ 
                    setState(() {_changePasswordVisibility();});
                  }
                ) 
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Text('Login')
                ],
              ),
              color: Colors.blue,
              splashColor: Colors.blueAccent,
              onPressed: () {
                if (_emailCpf != null && _emailCpf.isNotEmpty && _validarLogin(_emailCpf)) {
                  _auth.signInWithEmailAndPassword(email: _emailCpf, password: _senha)
                    .then((u) {
                      print(u);
                      Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (BuildContext ctx) => PaginaPrincipal()
                        )
                      );
                    })
                    .catchError((e) => print(e));
                }
              },
            ),
            RaisedButton(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("assets/images/google.png"), height: 30),
                  Text('Login com Google', textAlign: TextAlign.center )
                ],
              ),
              onPressed: () {
                _handleSignIn()
                  .then((FirebaseUser usuario) {
                    Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (BuildContext ctx) => PaginaPrincipal()
                        )
                      );
                  })
                  .catchError((e) => print(e));
              }
            )
          ],
        ),
      ),
    );
  }
}

