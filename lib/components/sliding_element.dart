import 'package:flutter/cupertino.dart';

class SlidingElement extends StatefulWidget {
  SlidingElement({this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() => SlidingElementState();
}

class SlidingElementState extends State<SlidingElement> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset(0, -3))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 2),
      child: SlideTransition(
        position: _animation,
        child: widget.child,
      ),
    );
  }
}