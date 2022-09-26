import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class CardColaborador extends StatelessWidget {
  CardColaborador(this.remedio, {Key? key}) : super(key: key);
  var remedio = "";
  static const IconData mode_edit_rounded =
      IconData(0xf8ca, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 48, 0, 48),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 380,
            height: 110,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.03, 0.02),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(183, 0, 0, 0),
                    child: Text(
                      'Mariana Pereira',
                      style: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          fontSize: 20,
                          color: textColor),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, -0.33),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Container(
                      width: 130,
                      height: 130,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/834/600',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, 0.93),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(80, 70, 0, 12),
                    child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          color: MyTheme.defaultTheme.primaryColor,
                        )),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, 0.93),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(80, 70, 0, 5),
                    child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          mode_edit_rounded,
                          color: Colors.white,
                          size: 20.0,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
