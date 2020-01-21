import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_task/components/sliding_element.dart';

class Exploration extends StatelessWidget {
  Exploration({this.explorationId});

  final int explorationId;

  @override
  Widget build(BuildContext context) {
    switch(explorationId) {
      case 1: {
        return SlidingElement(
          child: Image(
            image: AssetImage("assets/sun.png"),
            height: 200,
            width: 200,
          )
        );
      }

      default: {
        return Center();
      }
    }
  }
}