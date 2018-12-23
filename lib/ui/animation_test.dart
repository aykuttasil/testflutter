import 'package:flutter/material.dart';

class AnimationTestPage extends StatefulWidget {
  @override
  AnimationTestPageState createState() {
    return new AnimationTestPageState();
  }
}

class AnimationTestPageState extends State<AnimationTestPage>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  double _x = 300;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
    );

    _animation = Tween<double>(begin: 60.0, end: 36.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: _buildBody(context),
      backgroundColor: Colors.lightBlue[50],
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints box) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Aykut Asil"),
              _buildShape(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShape(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("tik");
        !_animationController.isCompleted
            ? _animationController.forward()
            : _animationController.reverse();
      },
      child: AnimatedPlaneIcon(
        animation: _animation,
      ),
      //child: ScaleTransition(

      //scale: _animation,
      //),
    );
  }
}

class AnimatedPlaneIcon extends AnimatedWidget {
  AnimatedPlaneIcon({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Container(
      width: animation.value,
      height: 300,
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.yellow,
        ),
        //borderRadius: BorderRadius.all(Radius.circular(50)),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(color: Colors.indigo[100]),
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
        gradient: LinearGradient(colors: [Colors.blue, Colors.deepOrange]),
      ),
      child: Center(child: Text("Aykut")),
    );
  }
}
