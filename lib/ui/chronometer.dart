import 'package:flutter/material.dart';

class ChronemeterPage extends StatefulWidget {
  @override
  ChronemeterPageState createState() {
    return new ChronemeterPageState();
  }
}

class ChronemeterPageState extends State<ChronemeterPage> {
  int x = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chronometer"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.indigo),
      ),
      child: Column(
        children: <Widget>[
          Text(x.toString()),
          Expanded(child: Container()),
          _buildTimeText(),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: RaisedButton(
              child: Text(
                "START",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                _changeText();
              },
            ),
          )
        ],
      ),
    );
  }

  _changeText() {
    setState(() {
      x += 1;
      Future.delayed(Duration(milliseconds: 1000), () => _changeText());
    });
  }

  Widget _buildTimeText() {
    return Container(
      width: 300,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple),
          gradient: LinearGradient(colors: [Colors.green, Colors.white])),
      child: Center(
        child: Text(
          x.toString(),
          style: TextStyle(
            fontSize: 50.0,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
      ),
    );
  }
}
