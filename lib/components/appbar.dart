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
      elevation: 0,
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          icon: const Icon(
            Icons.home,
            size: 25.0,
          ),
        ),
        IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.solidIdBadge,
            size: 25.0,
          ),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
        IconButton(
          icon: const Icon(
            Icons.menu_open,
            size: 25.0,
          ),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight/1.5);
}
