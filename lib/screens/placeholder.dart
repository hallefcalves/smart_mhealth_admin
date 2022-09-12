import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_admin/components/button.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class PlaceholderWidget extends StatelessWidget {
  PlaceholderWidget();

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
