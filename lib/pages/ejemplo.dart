import 'dart:async';

import 'package:flutter/material.dart';

import 'pregunta.dart';
// import 'package:votacion/pages/menu.dart';

final colorDeFondo = const Color.fromARGB(255, 0, 105, 92);

class Ejemplo extends StatefulWidget {
  @override
  _EjemploState createState() => _EjemploState();
}

class _EjemploState extends State<Ejemplo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: colorDeFondo,
          title: Text('Ejemplo'),
          actions: <Widget>[
            Pregunta(),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
              // ),
            ],
          ),
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

Widget txtUsuario() {
  return TextField(
    // controller: ctrlUsuario,
    decoration: InputDecoration(
      hintText:
          'Usuario de @coopvirtual', //AppLocalizations.of(context).translate('usuario'),     // 'Usuario',
      // icon: Icon(Icons.person),
      prefixIcon: Icon(Icons.account_circle),
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 50.0, 15.0),
      enabledBorder: const OutlineInputBorder(
        // borderSide: const BorderSide(color: Colors.black87, width: 1.0),
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      border: const OutlineInputBorder(),

      labelText:
          'Usuario', // AppLocalizations.of(context).translate('usuario'),  // 'Usuario',
    ),
  );
}

Widget txtClave() {
  return TextField(
    //  controller: ctrlClave,
    obscureText: true,
    decoration: InputDecoration(
      hintText:
          'Contraseña de @coopvirtual', //AppLocalizations.of(context).translate('clave'),// 'Clave',

      prefixIcon: Icon(Icons.vpn_key),
      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 50.0, 15.0),
      // border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
      enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.grey, width: 1.0),
      ),
      border: const OutlineInputBorder(),

      labelText:
          'Clave', //  AppLocalizations.of(context).translate('clave'),//'Clave',
    ),
  );
}

Widget btnIniciar() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 160,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: () {
            print('Button Clicked.');
          },
          textColor: Colors.white,
          color: colorDeFondo,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: colorDeFondo,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Iniciar sesion',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnRegistro() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 140,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: () {
            print('Button Clicked.');
          },
          textColor: Colors.white,
          color: colorDeFondo,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: colorDeFondo,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Registrate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget recuperarClave() {
  return Align(
    alignment: Alignment.bottomRight,
    child: FlatButton(
      // color: DBProvider.colorBoton,//

      child: Text(
        'Recuperar contraseña', // AppLocalizations.of(context).translate('aceptar'),
        //"ACEPTAR",

        style: TextStyle(
            // decoration: TextDecoration.underline,
            color: Colors.blue[900] // DBProvider.colorBoton,
            ),
      ),
      onPressed: () => print('dfasdf'),
    ),
  );
}

Widget botontes() {
  return Column(
    children: [
      Row(
        children: [btnIniciar(), btnRegistro()],
      ),
    ],
  );
}
