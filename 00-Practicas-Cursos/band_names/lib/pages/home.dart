import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/models/band.dart';
import 'package:provider/provider.dart';

import '../providers/socket_provider.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Band> bands = List.empty();

  @override
  void initState() {
    // TODO: implement initState
    final socketProvider = Provider.of<SockectProvider>(context, listen: false);
    socketProvider.socket.on('active-bands', (data) {
      print(data);
      this.bands = (data as List).map((band) => Band.fromMap(band)).toList();
    });
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    final socketProvider = Provider.of<SockectProvider>(context, listen: false);
    socketProvider.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final socketProvider = Provider.of<SockectProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: _iconStatus(socketProvider),
          )
        ],
        elevation: 1,
        title: Text(
          'Band Names',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: bands.length,
          itemBuilder: (BuildContext context, int index) =>
              _bandTile(bands[index])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewBand();
        },
        elevation: 1,
        child: Icon(Icons.add),
      ),
    );
  }

  Icon _iconStatus(SockectProvider socket) {
    if (socket.serverStatus == ServerStatus.Connectiong) {
      return Icon(
        Icons.local_hotel_rounded,
        color: Colors.orange[300],
      );
    } else if (socket.serverStatus == ServerStatus.Online) {
      return Icon(
        Icons.check_circle,
        color: Colors.blue[300],
      );
    } else {
      return Icon(
        Icons.offline_bolt,
        color: Colors.red[300],
      );
    }
  }

  Widget _bandTile(Band band) {
    final socketProvider = Provider.of<SockectProvider>(context, listen: false);
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print(direction);
        //TODO: Llamar el borrado en el server
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Delete Band',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text(
          '${band.votes}',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          socketProvider.socket.emit('vote-band', {'id': band.id});
          setState(() {});
        },
      ),
    );
  }

  void _addNewBand() {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('New band name:'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(
                    child: Text('Add'),
                    textColor: Colors.blue,
                    elevation: 5,
                    onPressed: () {
                      addBandToList(textController.text);
                    })
              ],
            );
          });
    } else if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('New band name:'),
              content: CupertinoTextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Add'),
                  onPressed: () {
                    addBandToList(textController.text);
                  },
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Dimiss'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }

  void addBandToList(String name) {
    final socketProvider = Provider.of<SockectProvider>(context, listen: false);

    if (name.length > 1) {
      socketProvider.socket.emit('add-band', {'name': name});
      setState(() {});
    }

    Navigator.pop(context);
  }
}
