import 'package:flutter/material.dart';
import 'dart:io';
import 'package:votacion/db_Provider.dart';

//region idiomas

//import 'package:pagocoop/AppLanguage.dart';
//import 'package:pagocoop/app_localizations.dart';

//endregion

class Pregunta extends StatefulWidget {
  @override
  _PreguntaState createState() => _PreguntaState();
}

class _PreguntaState extends State<Pregunta> {
  _PreguntaState();
  static bool salir = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () async {
        _showDialog(context, DBProvider.preguntaSalir
            // 'Esta seguro que desea finalizar la aplicación?'
            );
      },
    );
  }

  Widget cancelButton2(context) {
    return FlatButton(
      color: DBProvider.colorLetraBlanca, //
      child: Text(
        'Cancelar', // AppLocalizations.of(context).translate('cancelar'),
        style: TextStyle(
          // decoration: TextDecoration.underline,
          color: DBProvider.colorBoton,
        ),
      ),

      onPressed: () => Navigator.pop(context),
    );
  }

  Widget continueButton(context) {
    return FlatButton(
      // color: DBProvider.colorBoton,//
      child: Text(
        'Aceptar', // AppLocalizations.of(context).translate('aceptar'),
        //"ACEPTAR",

        style: TextStyle(
          // decoration: TextDecoration.underline,
          color: DBProvider.colorBoton,
        ),
      ),
      onPressed: () => exit(0),
    );
  }

  Future<void> _showDialog(BuildContext context, String msg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Aviso'), // AppLocalizations.of(context).translate('aviso')),
          content: Text('Desea salir?'),
          actions: <Widget>[
            cancelButton2(context),
            continueButton(context),

//            FlatButton(
//              child: Text('Aceptar'),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
          ],
        );
      },
    );
  }
}
