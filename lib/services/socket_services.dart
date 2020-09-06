import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { Online, Offline, Connecting }

class SockeServices with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  get serverStatus => this._serverStatus;

  SockeServices() {
    _initConfig();
  }

  void _initConfig() {
// Dart client
    // String myIp = 'http://mpe-hdelarosa:3000/';
    String myIp = 'http://192.168.1.17:3000/';
/*
    IO.Socket socket = IO.io(myIp, {
      'transports': ['websocket'],
      'autoConnect': true
    });

*/

    IO.Socket socket = IO.io(myIp, <String, dynamic>{
      'transports': ['websocket'],
      'extraHeaders': {'foo': 'bar'},
      'autoConnect': true
    });

    socket.on('connect', (_) {
      print('Conectado al servidor de NODE!!');
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });

    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) {
      print('Desconectado!!');
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
    socket.on('fromServer', (_) => print(_));
  }
}
