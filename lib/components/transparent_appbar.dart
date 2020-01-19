import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentAppbar extends StatelessWidget implements PreferredSizeWidget {

  const TransparentAppbar({Key key, this.height, this.buttonsColor}) : super(key: key);

  final double height;
  final Color buttonsColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      leading: IconButton(
        icon: Icon(
            Icons.menu,
            color: buttonsColor
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}