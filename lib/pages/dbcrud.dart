import 'dart:async';

import 'package:flutter/material.dart';
import 'package:votacion/dbhelper.dart';

import 'pregunta.dart';
// import 'package:votacion/pages/menu.dart';

final colorDeFondo = const Color.fromARGB(255, 0, 105, 92);

final dbhelper = Databasehelper.instance; //Para la base de datos local

void insertdata() async {
  try {
    Map<String, dynamic> row = {
      // Databasehelper.columNombre: "Felicia",
      // Databasehelper.columnEdad: 20,
      Databasehelper.columnIdInstitucionU: 1,
      Databasehelper.columnUsuarioU: "fclemente",
      Databasehelper.columnNombreU: "Felipe",
      Databasehelper.columnApellidoU: "Clemente",
      Databasehelper.columntipoDeUsuarioU: 1,
      Databasehelper.columnClaveU: "1234",
      Databasehelper.columnidComercioU: 1978,
      Databasehelper.columntipoDeUsuarioU: 2
    };
    final id = await dbhelper.insert(row);
    print(id);
    print('INSERTO LO DATOS');
  } catch (e) {
    print('Metodo:dbcrud.dart-insertdata ||' + e.toString());
  }
}

void queryall() async {
  try {
    var allrows = await dbhelper.queryall();
    allrows.forEach((row) {
      print(row);
    });
  } catch (e) {
    print('Metodo:dbcrud.dart-queryall ||' + e.toString());
  }
}

void queryspecific() async {
  try {
    var allrows = await dbhelper.queryspecific(2);
    print(allrows);
  } catch (e) {
    print('Metodo:dbcrud.dart-queryspecific ||' + e.toString());
  }
}

void delete() async {
  try {
    var id = await dbhelper.deletedata(2);
    print(id);
  } catch (e) {
    print('Metodo:dbcrud.dart-delete ||' + e.toString());
  }
}

void update() async {
  try {
    var row = await dbhelper.updatedata(20);
    print(row);
  } catch (e) {
    print('Metodo:dbcrud.dart-update ||' + e.toString());
  }
}

void borrarDB() async {
  try {
    await dbhelper.borrarBaseDeDatos();
    print('Base de datos eliminada!!!!');
  } catch (e) {
    print('Metodo:dbcrud.dart-borrarDB ||' + e.toString());
  }
}

class Dbcrud extends StatefulWidget {
  @override
  _DbcrudState createState() => _DbcrudState();
}

class _DbcrudState extends State<Dbcrud> {
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
          title: Text('Dbcrud'),
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
                    btnInsertar(),
                    SizedBox(height: 20),
                    btnConsulta(),
                    SizedBox(height: 20),
                    btnActualizar(),
                    SizedBox(height: 20),
                    btnBorrar(),
                    SizedBox(height: 20),
                    btnConsultaEspecifica(),
                    SizedBox(height: 20),
                    btnEliminarDB(),
                  ],
                ),
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

Widget btnInsertar() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: insertdata,
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
                      'Insertar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnConsulta() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: queryall,
          textColor: Colors.white,
          color: Colors.blue,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Consulta',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.query_builder,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnActualizar() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: update,
          textColor: Colors.white,
          color: Colors.yellow,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.yellow,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Actualizar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.update,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnBorrar() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: delete,
          textColor: Colors.white,
          color: Colors.red,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Borrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnConsultaEspecifica() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: queryspecific,
          textColor: Colors.white,
          color: Colors.blue,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Consulta esp.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.query_builder,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnEliminarDB() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      // width: double.infinity,
      height: 40,
      width: 170,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: borrarDB,
          textColor: Colors.white,
          color: Colors.red,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Eliminar DB.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.data_usage,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}
