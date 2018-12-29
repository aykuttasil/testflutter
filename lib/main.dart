import 'package:flight_search/ui/chronometer.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryTextTheme: TextTheme(
          display1: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      home: ChronemeterPage(),
    );
  }
}
