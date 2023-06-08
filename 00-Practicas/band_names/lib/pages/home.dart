import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:band_names/models/band.dart';

class HomePage extends StatefulWidget {
  static const route = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Band> bands = [
    Band(id: '1', name: 'Metalica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 4),
    Band(id: '3', name: 'Kiss', votes: 3),
    Band(id: '4', name: 'Bon Jovi', votes: 2),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

  Widget _bandTile(Band band) => Dismissible(
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
          onTap: () {},
        ),
      );
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
    if (name.length > 1) {
      this
          .bands
          .add(new Band(id: DateTime.now().toString(), name: name, votes: 1));
      setState(() {});
    }

    Navigator.pop(context);
  }
}
