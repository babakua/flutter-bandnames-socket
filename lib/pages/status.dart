import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; //Para manejar el estado
import 'package:votacion/services/socket_services.dart';

import 'package:flutter/cupertino.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SockeServices>(context);

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('ServerStatus:${socketService.serverStatus}'),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketService.socket.emit('emitir-mensaje', 'Mensaje desde fluter');
        },
      ),
    );
  }
}
