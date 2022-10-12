import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/visualizar_remedio.dart';
import '../http/remedio/remedio.dart';
import '../screens/cadastro_remedio.dart';

// ignore: must_be_immutable
class CardRemedio extends StatelessWidget {
  CardRemedio(this.remedio, {Key? key}) : super(key: key);
  Remedio remedio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 380,
            height: 150,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1.03, 0.02),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(183, 0, 0, 0),
                    child: Text(
                      remedio.name ?? "Paracetamol",
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
                        'lib/assets/images/medicine.png',
                        scale: 2.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.72, 0.60),
                  child: FFButtonWidget(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Visualizar_Remedio(),
                        ),
                      )
                    },
                    text: '+ Mais informações',
                    options: FFButtonOptions(
                      width: 160,
                      height: 30,
                      color: Colors.white,
                      textStyle: TextStyle(
                          fontFamily: GoogleFonts.inter().fontFamily,
                          color: primaryColor),
                      borderSide: const BorderSide(
                        color: primaryColor,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, 0.93),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(115, 50, 0, 20),
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
                const Align(
                  alignment: AlignmentDirectional(-1.02, -0.33),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(123, 90, 0, 12),
                    child: FaIcon(
                      FontAwesomeIcons.penToSquare,
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
