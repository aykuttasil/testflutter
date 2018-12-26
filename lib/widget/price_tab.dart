import 'package:flutter/material.dart';

class PriceTab extends StatefulWidget {
  final double height;
  const PriceTab({Key key, this.height}) : super(key: key);

  @override
  _PriceTabState createState() => new _PriceTabState();
}

class _PriceTabState extends State<PriceTab> with TickerProviderStateMixin {
  final double _initialPlanePaddingBottom = 16.0;
  final double _minPlanePaddingTop = 16.0;

  AnimationController _planeSizeAnimationController;
  AnimationController _planeMoveAnimationController;
  Animation _planeSizeAnimation;
  Animation _planeMoveAnimation;

/*
  final double _initialPlanePaddingBottom = 16.0;
  double get _planeTopPadding =>
      widget.height - _initialPlanePaddingBottom - _planeSize;

  double get _planeSize => _planeSizeAnimation.value;
  */

  double get _planeTopPadding =>
      _minPlanePaddingTop +
      (1 - _planeMoveAnimation.value) * _maxPlaneTopPadding;

  double get _maxPlaneTopPadding =>
      widget.height - _initialPlanePaddingBottom - _planeSize;

  double get _planeSize => _planeSizeAnimation.value;

  @override
  void initState() {
    super.initState();
    _initSizeAnimations();
    _initPlaneTravelAnimations();
    _planeSizeAnimationController.forward();
  }

  _initSizeAnimations() {
    _planeSizeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 340),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(milliseconds: 500),
              () => _planeMoveAnimationController.forward());
        }
      });

    _planeSizeAnimation =
        Tween<double>(begin: 60.0, end: 36.0).animate(CurvedAnimation(
      parent: _planeSizeAnimationController,
      curve: Curves.easeOut,
    ));
  }

  _initPlaneTravelAnimations() {
    _planeMoveAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _planeMoveAnimation = CurvedAnimation(
      parent: _planeMoveAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _planeSizeAnimationController.dispose();
    _planeMoveAnimationController.dispose();
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

/*
  Widget _buildPlane() {
    return Positioned(
      top: _planeTopPadding,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(
            animation: _planeSizeAnimation,
          ),
          Container(
            width: 2,
            height: 200,
            color: Colors.indigo,
          )

          //_buildPlaneIcon(),
        ],
      ),
    );
  }
}
*/

  Widget _buildPlane() {
    return AnimatedBuilder(
      animation: _planeMoveAnimation,
      child: Column(
        children: <Widget>[
          AnimatedPlaneIcon(animation: _planeSizeAnimation),
          Container(
            width: 2.0,
            height: 240.0,
            color: Color.fromARGB(255, 200, 200, 200),
          ),
        ],
      ),
      builder: (context, child) => Positioned(
            top: _planeTopPadding,
            child: child,
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
