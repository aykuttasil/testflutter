import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  final double height;
  const PriceTab({Key key, this.height}) : super(key: key);

  @override
  _PriceTabState createState() => new _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  AnimationController _planeSizeAnimationController;
  Animation _planeSizeAnimation;

  final double _initialPlanePaddingBottom = 16.0;
  double get _planeTopPadding =>
      widget.height - _initialPlanePaddingBottom - _planeSize;
  double get _planeSize => _planeSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _planeSizeAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 500,
        ));
    _planeSizeAnimation = Tween<double>(begin: 60, end: 36).animate(
        CurvedAnimation(
            parent: _planeSizeAnimationController, curve: Curves.easeInOut));
    _planeSizeAnimationController.forward();
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _buildPlane(),
          ],
        ));
  }

  Widget _buildPlane() {
    return Positioned(
      top: _planeTopPadding,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(
            animation: _planeSizeAnimation,
          )
          //_buildPlaneIcon(),
        ],
      ),
    );
  }
}

class AnimatedPlaneIcon extends AnimatedWidget {
  AnimatedPlaneIcon({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = super.listenable;
    return Icon(
      Icons.airplanemode_active,
      color: Colors.red,
      size: animation.value,
    );
  }
}
