import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:votacion/models/band.dart';

import 'package:provider/provider.dart'; //Para manejar el estado
import 'package:votacion/services/socket_services.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* 
 List<Band> bands = [
    Band(id: '1', name: 'Banda Mix', votes: 20),
    Band(id: '2', name: 'Queen', votes: 8),
    Band(id: '3', name: 'Heroes del silencio', votes: 13),
    Band(id: '4', name: 'Bon Jovi', votes: 15),
    Band(id: '5', name: 'Metallica', votes: 1)
];
*/

  List<Band> bands = [];

  @override
  void initState() {
    final socketService = Provider.of<SockeServices>(context, listen: false);

    socketService.socket.on('active-bands', _handleActiveBands);
    super.initState();
  }

  _handleActiveBands(dynamic payload) {
    this.bands = (payload as List).map((band) => Band.fromMap(band)).toList();

    setState(() {});
  }

  @override
  void dispose() {
    final socketService = Provider.of<SockeServices>(context, listen: false);
    socketService.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SockeServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Airs Lines', style: TextStyle(color: Colors.black87)),
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
      body: Column(
        children: <Widget>[
          _showGraph(),
          Expanded(
            child: ListView.builder(
                itemCount: bands.length,
                itemBuilder: (context, i) => _bandTitle(bands[i])),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), elevation: 1, onPressed: addNewBand),
    );
  }

  Widget _bandTitle(Band band) {
    final socketService = Provider.of<SockeServices>(context, listen: false);

    return Dismissible(
      key: UniqueKey(), // Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
          padding: EdgeInsets.only(left: 8.0),
          color: Colors.red[300],
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text('Delete Band', style: TextStyle(color: Colors.white)),
          )),
      onDismissed: (_) {
        socketService.emit('delete-band', {'id': band.id});
        print(band.id);
        print('Codigo de la banda es:' + band.id);
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(band.id);
          socketService.socket.emit('vote-band', {'id': band.id});
        },
      ),
    );
  }

  addNewBand() {
    final textController = new TextEditingController();

    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (_) {
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
    if (name.length > 1) {
      //El listen:false es como estamos fuera de un widget no trate de refrescar la pantalla
      final socketService = Provider.of<SockeServices>(context, listen: false);
      socketService.emit('add-band', {'name': name});
    }
    Navigator.pop(context);
  }

  Widget _showGraph() {
    Map<String, double> dataMap = new Map();
    bands.forEach((band) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
      // print('Nombre de banda:' + band.name);
    });

    //print(dataMap);
    /*
    dataMap.putIfAbsent('American Air Line', () => 5);
    dataMap.putIfAbsent('COPA', () => 4);
    dataMap.putIfAbsent('JET BLUE', () => 13);
    dataMap.putIfAbsent('Air EUROPA', () => 25);
*/

    final List<Color> colorList = [
      Colors.orange[100],
      Colors.green[100],
      Colors.yellow[200],
      Colors.pink[100],
    ];

    // return PieChart(dataMap: dataMap, chartType: ChartType.ring);
    return Container(
        width: double.infinity,
        height: 150,
        child: PieChart(
            dataMap: dataMap,
            colorList: colorList,
            chartType: ChartType.ring,
            animationDuration: Duration(milliseconds: 800)));
  }
}
