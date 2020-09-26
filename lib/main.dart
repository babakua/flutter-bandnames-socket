import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Para manejar el estado
import 'package:votacion/pages/dbcrud.dart';
import 'package:votacion/pages/ejemplo.dart';
import 'package:votacion/pages/home.dart';
import 'package:votacion/pages/inicio.dart';
import 'package:votacion/pages/status.dart';
import 'package:votacion/pages/menu.dart';
import 'package:votacion/pages/login.dart';
import 'package:votacion/services/socket_services.dart';

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
        initialRoute: 'home', //Pagina de inicio
        routes: {
          'inicio': (_) => Inicio(),
          'login': (_) => Login(),
          'home': (_) => HomePage(),
          'status': (_) => StatusPage(),
          'menu': (_) => NavDrawerExample(),
          'ejemplo': (_) => Ejemplo(),
          'cruddb': (_) => Dbcrud(),
        },
      ),
    );
  }
}
