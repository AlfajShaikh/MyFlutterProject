import 'package:flutter/material.dart';

class MyTable extends StatefulWidget {
  createState() {
    return StateKeeper();
  }
}

class StateKeeper extends State<MyTable> {
  bool visibilityTableRow = true;

  void _changed() {
    setState(() {
      if (visibilityTableRow) {
        visibilityTableRow = false;
      } else {
        visibilityTableRow = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: true,
        appBar: AppBar(
          title: Text("Table View"),
        ),
        body: Column(
          children: <Widget>[
            Table(
              border: TableBorder.all(width: 1.0, color: Colors.black),
              children: [
                TableRow(children: [
                  TableCell(
                      child: Row(children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text('ID1'),
                    ),
                  ])),
                  TableCell(
                      child: Row(children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text('Name1'),
                    ),
                  ]))
                ]),
                visibilityTableRow
                    ? TableRow(children: [
                        TableCell(
                            child: Row(children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Text('ID2'),
                          ),
                        ])),
                        TableCell(
                            child: Row(children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Text('Name2'),
                          ),
                        ]))
                      ])
                    : new TableRow(children: [
                        TableCell(
                            child: Row(children: <Widget>[
                          new Container(),
                        ])),
                        TableCell(
                            child: Row(children: <Widget>[
                          new Container(),
                        ]))
                      ]),
                TableRow(children: [
                  TableCell(
                      child: Row(children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text('ID3'),
                    ),
                  ])),
                  TableCell(
                      child: Row(children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text('Name3'),
                    ),
                  ]))
                ]),
              ],
            ),
            RaisedButton(
              child: Text("Hide/Show Table Row"),
              onPressed: () => _changed(),
            ),
          ],
        ));
  }
}
