import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardColaborador extends StatelessWidget {
  CardColaborador(this.remedio, {Key? key}) : super(key: key);
  var remedio = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 380,
            height: 180,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.03, 0.02),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(183, 0, 0, 5),
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
                      child: Image.asset(
                        'lib/assets/images/marianapereira.jpg',
                        scale: 2.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, 0.93),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(115, 50, 0, 40),
                    child: Container(
                        width: 33,
                        height: 33,
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
                  alignment: const AlignmentDirectional(-1.02, -0.33),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(123, 90, 0, 12),
                    child: FaIcon(
                      FontAwesomeIcons.edit,
                      size: 20,
                    ),
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
