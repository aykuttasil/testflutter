import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Http Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static String _url = "http://www.aykutasil.com";
  String _sonuc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sonuc = "test";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text(_sonuc),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _sonuc = "";
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
