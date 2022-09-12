import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_admin/screens/placeholder.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class CustomBtnIcon extends StatelessWidget {
  CustomBtnIcon(this.icone,this.btntext, this.themeColor, this.child);
  final String btntext;
  final Color themeColor;
  final Widget child;
  final Iconify icone;

  var routes = {
    '/placeholder': (BuildContext context) => PlaceholderWidget(),
  };
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => child)),
      icon: icone,
      style: ElevatedButton.styleFrom(
        primary: themeColor,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 25,
        ),
        minimumSize: const Size(170, 65),
        maximumSize: const Size(340, 130),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      label: Text(btntext),
    );
  }
}
