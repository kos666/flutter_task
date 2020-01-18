import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solid_software_task/components/scene.dart';
import 'package:solid_software_task/components/transparent_appbar.dart';

/*
* 3. The application should: display the text "Hey there"
* in the middle of the screen and after tapping anywhere
* on the screen a background color should be changed to
* a random color. You can also add any other feature to
* the app - that adds bonus points
* */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Task',
      home: HomeScreen(),
    );
  }
}



