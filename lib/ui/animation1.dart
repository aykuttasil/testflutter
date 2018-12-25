import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _topMarginButton = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Test"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        child: _buildX(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airplanemode_active),
        onPressed: () {
          setState(() {
            _topMarginButton += 50;
          });
        },
      ),
    );
  }

  Widget _buildX() {
    return Column(
      children: <Widget>[
        _buildButton(),
      ],
    );
  }

  Widget _buildButton() {
    return AnimatedContainer(
      margin: EdgeInsets.only(top: _topMarginButton),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.airplanemode_active),
      duration: Duration(milliseconds: 1000),
      curve: Curves.bounceOut,
    );
  }
}
