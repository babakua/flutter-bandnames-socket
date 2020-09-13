import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Para manejar el estado
import 'package:votacion/pages/home.dart';
import 'package:votacion/pages/status.dart';
import 'package:votacion/pages/menu.dart';
import 'package:votacion/pages/login.dart';
import 'package:votacion/services/socket_services.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Manejando el estado
      providers: [ChangeNotifierProvider(create: (_) => SockeServices())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login', //Pagina de inicio
        routes: {
          'login': (_) => Login(),
          'home': (_) => HomePage(),
          'status': (_) => StatusPage(),
          'menu': (_) => NavDrawerExample()
        },
      ),
    );
  }
}
