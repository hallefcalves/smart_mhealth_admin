import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomBtn extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomBtn(this.btntext, this.themeColor, this.child);
  final String btntext;
  final Color themeColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => child)),
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
      child: Text(
        btntext,
      ),
    );
  }
}
