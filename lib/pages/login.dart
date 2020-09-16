import 'dart:async';

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
            FlatButton(
              child: Text('Entrar'),
              onPressed: () {
                print('test');

                //  Navigator.push(context, route());\\
                // Navigator.push(context,MaterialPageRoute(builder: (context) => NavDrawerExample());

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new NavDrawerExample()));

                //De esta forma no podemos realizar un back a la pagina anterior
                // buildPushReplacementNamed(context);
              },
            ),
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    logo(),
                    Text('Usuario'),

/*
                    
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('The Enchanted Nightingale'),
                      subtitle:
                          Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    ButtonBar(

                      children: <Widget>[
                        FlatButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        FlatButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),

*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Object> buildPushReplacementNamed(BuildContext context) =>
      Navigator.pushReplacementNamed(context, 'NavDrawerExample');
}

Widget logo() {
  return Image.asset(
    'assets/logo.jpg',
    width: 300,
  );
}
