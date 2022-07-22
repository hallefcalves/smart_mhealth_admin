// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class LetfTxt extends StatelessWidget {
  const LetfTxt(this.tamanhoFont, this.texto);
  final double tamanhoFont;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.left,
        style: GoogleFonts.inter(
          fontSize: tamanhoFont,
          fontWeight: FontWeight.w700,
        ),
        texto,
      ),
    );
  }
}
