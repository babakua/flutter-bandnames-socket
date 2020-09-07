import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SockeServices with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  IO.Socket _socket; //Para exponer este objeto a las demas paginas

  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket; //

  SockeServices() {
    _initConfig();
  }

  void _initConfig() {
// Dart client
    // String myIp = 'http://192.168.1.17:3000/';
    String myIp = 'http://10.172.0.211:3000/';

    this._socket = IO.io(myIp, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'},
      'autoConnect': true
    });

    //Se conecta
    this._socket.on('connect', (_) {
      print('Conectado al servidor de NODE!!');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    //Se desconecta
    this._socket.on('disconnect', (_) {
      print('Desconectado!!');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });

    //Si un cliente envia algun mensaje se ve este mensaje
    /*
    socket.on('nuevo-mensaje', (payload) {
      //Poner en el HTML socket:
      //socket.emit('emitir-mensaje',{nombre:'hector',apellido:'De la rosa'});
      print(payload);
      print(payload.containsKey('nombre')
          ? payload['nombre']
          : 'No llego el nombre');
    });
    */

    this._socket.on('event', (data) => print(data));

    this._socket.on('fromServer', (_) => print(_));
  }
}
