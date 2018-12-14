import 'package:flutter/material.dart';
import 'package:testflutter/widget/filterbox.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.amber,
          primaryColor: Colors.red),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Filter Box",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.notifications_none,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Icon(Icons.search, color: Colors.grey),
          ),
        ],
      ),
      body: Center(child: FilterBox()),
      backgroundColor: Colors.white,
    );
  }
}
