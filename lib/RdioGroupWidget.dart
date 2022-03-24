import 'package:flutter/material.dart';

class redio extends StatefulWidget {
  const redio({Key? key}) : super(key: key);

  @override
  _redioState createState() => _redioState();
}

class _redioState extends State<redio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rediobutton(),
    );
  }
}

enum Bestsite { one, two, three }

class rediobutton extends StatefulWidget {
  const rediobutton({Key? key}) : super(key: key);

  @override
  _rediobuttonState createState() => _rediobuttonState();
}

class _rediobuttonState extends State<rediobutton> {
  Bestsite _site = Bestsite.one;
  @override
  Widget build(BuildContext context) {
    int _counter = 0;
    int group = 1;
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          ListTile(
            title: Text("dvvv"),
            leading: Radio(
              value: Bestsite.one,
              groupValue: _site,
              onChanged: (Bestsite? value) {
                setState(() {
                  _site = value!;
                });
              },
            ),
          ),
          SizedBox(
            height: 0,
          ),
          ListTile(
            title: Text("dvvv"),
            leading: Radio(
              value: Bestsite.two,
              groupValue: _site,
              onChanged: (Bestsite? value) {
                setState(() {
                  _site = value!;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
