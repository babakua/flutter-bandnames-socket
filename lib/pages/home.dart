import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votacion/models/band.dart';

import 'package:provider/provider.dart'; //Para manejar el estado
import 'package:votacion/services/socket_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Banda Mix', votes: 20),
    Band(id: '2', name: 'Queen', votes: 8),
    Band(id: '3', name: 'Heroes del silencio', votes: 13),
    Band(id: '4', name: 'Bon Jovi', votes: 15),
    Band(id: '5', name: 'Metallica', votes: 1)
  ];
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SockeServices>(context);

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('BandNames', style: TextStyle(color: Colors.black87)),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                child: (socketService.serverStatus == ServerStatus.Online)
                    ? Icon(Icons.check_circle, color: Colors.blue[300])
                    : Icon(Icons.offline_bolt, color: Colors.red)),
          ],
        ),
        body: ListView.builder(
            itemCount: bands.length,
            itemBuilder: (context, i) => _bandTitle(bands[i])),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), elevation: 1, onPressed: addNewBand),
      ),
    );
  }

  Widget _bandTitle(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red[300],
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Delete Band', style: TextStyle(color: Colors.white)),
          )),
      onDismissed: (direction) => print('Codigo de la banda es:' + band.id),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('New band name:'),
            content: TextField(
              controller: textController,
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Add'),
                  elevation: 5,
                  textColor: Colors.blue,
                  onPressed: () => addBandToList(textController.text))
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
              title: Text('New band name:'),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('Add'),
                    onPressed: () => addBandToList(textController.text)),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: Text('Dismiss'),
                    onPressed: () => Navigator.pop(context)),
              ],
            );
          });
    }
  }

  void addBandToList(String name) {
    if (name.length > 10) {
      //Podemos agregar
      print('Nueva banda:' + name);
      this
          .bands
          .add((new Band(id: DateTime.now().toString(), name: name, votes: 0)));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
