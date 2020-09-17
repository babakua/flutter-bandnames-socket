import 'dart:async';

import 'package:flutter/material.dart';
import 'package:votacion/pages/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'pregunta.dart';

List imgList = ['assets/logo1.jpg', 'assets/logo2.jpg', 'assets/logo3.jpg'];
final colorDeFondo = const Color.fromARGB(255, 0, 105, 92);

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
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: colorDeFondo,
          title: Text('COOPBUENO Móvil'),
          actions: <Widget>[
            Pregunta(),
          ],
        ),
        body:

            // SingleChildScrollView(
            // child:

            Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('14  Sep 2020'),
            ),
            Spacer(),
            logo(),
            imagenes(context),
            Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          espacioEntreObjetos(),
                          espacioEntreObjetos(),
                          btnAcceso(context),
                          espacioEntreObjetos(),
                          btnOtrasInformaciones(),
                          espacioEntreObjetos(),
                          configuracion(),
                          espacioEntreObjetos(),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
        //),
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

Widget logo() {
  return Image.asset('assets/logo.jpg');
}

Widget espacioEntreObjetos() {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
  );
}

Widget btnAcceso(context) {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
      child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => new Login()));
          },
          textColor: Colors.white,
          color: colorDeFondo,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: colorDeFondo,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Acceso',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget btnOtrasInformaciones() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
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
                      'Otras Informaciones',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget configuracion() {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: double.infinity,
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
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    color: colorDeFondo,
                    padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                    child: Text(
                      'Configuración',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ))));
}

Widget imgruta(String ruta) {
  return Image.asset(
    ruta,
    fit: BoxFit.fill,
    height: 110.0,
    width: double.infinity,
  );
}

Widget imagenes(BuildContext context) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        listaMov(context),

        /*
        CarouselSlider(
          options: CarouselOptions(autoPlay: true, initialPage: 0),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child:

                            //Text(item.toString())

                            imgruta((item.toString()))),
                    color: Colors.white,
                  ))
              .toList(),
        )
        */
      ],
    ),
  );
}

Widget listaMov(BuildContext context) {
  return CarouselSlider(
    options: CarouselOptions(
      height: 200.0,
      autoPlay: true,
      initialPage: 0,
      enableInfiniteScroll: true,
      enlargeCenterPage: true,
      autoPlayInterval: Duration(seconds: 2),
      autoPlayAnimationDuration: Duration(milliseconds: 2000),
      pauseAutoPlayOnTouch: true,
      scrollDirection: Axis.horizontal,
    ),
    items: imgList
        .map((item) => Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                  child:

                      //Text(item.toString())

                      imgruta((item.toString()))),
              color: Colors.white,
            ))
        .toList(),
  );
}
