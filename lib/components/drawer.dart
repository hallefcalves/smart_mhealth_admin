import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ElevatedButton(onPressed: () {}, child: Text('Home'),),
        ],
      ),
    );
  }
}
