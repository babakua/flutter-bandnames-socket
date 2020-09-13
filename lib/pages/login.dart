import 'package:flutter/material.dart';
import 'package:votacion/pages/menu.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      child: Scaffold(
        body: Column(
          children: [
            Text('login'),
            Text('aaaa'),
            FlatButton(
              child: Text('Entrar'),
              onPressed: () => print(
                  'boton'), //Navigator.of(context).push('NavDrawerExample'),
            )
          ],
        ),
      ),
    );
  }
}

/*
FlatButton(
  onPressed: () {
    /*...*/
    Navigator.of(context).push(_NewPage(2))
  },
  child: Text(
    "Flat Button",
  ),
)
*/
