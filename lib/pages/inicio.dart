import 'dart:async';

import 'package:flutter/material.dart';
import 'package:votacion/pages/login.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      top: true,
      right: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('COOPBUENO Móvil'),
          actions: <Widget>[
            // Pregunta(),
          ],
        ),
        body: Column(
          children: [
            Text('14  Sep 2020'),
            FlatButton(
              child: Text('Entrar'),
              onPressed: () {
                print('Acceso');

                //  Navigator.push(context, route());\\
                // Navigator.push(context,MaterialPageRoute(builder: (context) => NavDrawerExample());

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => new Login()));

                //De esta forma no podemos realizar un back a la pagina anterior
                // buildPushReplacementNamed(context);
              },
            ),
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    espacioEntreObjetos(),
                    espacioEntreObjetos(),
                    btnAcceso(),
                    espacioEntreObjetos(),
                    btnOtrasInformaciones(),
                    espacioEntreObjetos(),
                    configuracion(),
                    espacioEntreObjetos(),
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

Widget titulo() {
  return Text('PagoCOOP',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.green[400],
        fontFamily: 'Lobster',
      ));
}

Widget espacioEntreObjetos() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
  );
}

Widget btnAcceso() {
  return SizedBox(
    width: double.infinity,
    child: RaisedButton(
      onPressed: () => print('Acceso'),
      textColor: Colors.white,
      color: Colors.green[700],
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        'Acceso',
        //"Entrar",
      ),
    ),
  );
}

Widget btnOtrasInformaciones() {
  return SizedBox(
    width: double.infinity,
    child: RaisedButton(
      onPressed: () => print('Acceso'),
      textColor: Colors.white,
      color: Colors.green[700],
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        'Acceso',
        //"Entrar",
      ),
    ),
  );
}

Widget configuracion() {
  return Padding(
    padding: const EdgeInsets.all(1.0), //EdgeInsets.only(top: 15.0),
    child: SizedBox(
        width: double.infinity,
        child: RaisedButton.icon(
          textColor: Colors.white,
          icon: Icon(
            Icons.arrow_forward,
          ),
          color: Colors.green[700],
          label: const Text('Configuración'),
          onPressed: () {},
        )),
  );

  // return SizedBox(
  //   width: double.infinity,
  //   child: RaisedButton(
  //     onPressed: () => print('Configuraciones'),
  //     textColor: Colors.white,

  //     color: Colors.green[700],
  //     padding: const EdgeInsets.all(8.0),
  //     child: new Text(
  //       'Configuración',
  //       //"Entrar",
  //     ),
  //   ),
  // );
}
