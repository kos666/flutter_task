import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TransparentAppbar extends StatelessWidget {
  TransparentAppbar({this.buttonsColor});

  final Color buttonsColor;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottomOpacity: 0,
          leading: Icon(
            Icons.menu,
            color: buttonsColor,
          ),
        )
    );
  }
}