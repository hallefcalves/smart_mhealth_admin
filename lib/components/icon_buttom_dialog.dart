import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_admin/components/center_text.dart';
import 'package:smart_mhealth_admin/components/left_text.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class IconDialog extends StatelessWidget {
  const IconDialog(this.icone, this.corCaixa, this.corIcone, this.titulo, this.descricao,
      this.texto);
  final Color corCaixa;
  final Color corIcone;
  final String titulo;
  final String descricao;
  final String texto;
  final Iconify icone;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icone,
      iconSize: 50,
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
          backgroundColor: corCaixa,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 1),
                child: IconButton(
                  icon:
                      Iconify(Eva.close_circle_fill, color: corIcone, size: 45),
                  onPressed: () => Navigator.pop(context, 'OK'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CenterTxt(22, titulo),
              )
            ],
          ),
          content: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CenterTxt(19,descricao)),
              Padding(
                padding: EdgeInsets.only(top: 35),
                child: CenterTxt(16, texto),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(
                'OK',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
