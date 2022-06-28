import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyTheme.defaultTheme.appBarTheme.backgroundColor,
      iconTheme: IconThemeData(color: MyTheme.defaultTheme.primaryColor),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: Icon(Icons.home),
        ),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.solidIdBadge),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
