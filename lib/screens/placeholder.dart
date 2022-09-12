import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: MyTheme.defaultTheme.primaryColor,
       ),
      backgroundColor: Colors.amber,
    );
  }
}
