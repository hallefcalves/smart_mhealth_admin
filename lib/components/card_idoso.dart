import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class CardIdoso extends StatelessWidget {
  CardIdoso(this.idoso, {Key? key}) : super(key: key);
  var idoso = "";

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: const Color(0xFFF5F5F5),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 21),
                  child: Container(
                    width: 175,
                    height: 175,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/364/600',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Ver Perfil',
                    options: FFButtonOptions(
                      width: 146,
                      height: 57,
                      color: secondaryColor,
                      textStyle: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily
                      ),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 100,
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: '+ Remédios',
                  options: FFButtonOptions(
                    width: 177,
                    height: 57,
                    color: secondaryColor,
                    textStyle: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily
                    ),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 100,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 26, 0, 28),
                  child: Text(
                    'Severina Pereira',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontSize: 24,
                      color: textColor
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 224,
                  decoration: BoxDecoration(
                    color: background,
                    border: Border.all(
                      color: secondaryColor,
                    ),
                  ),
                  child: Stack(
                    alignment: const AlignmentDirectional(
                        0.05, 0.05),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.82, -1.07),
                        child: Container(
                          width: 140,
                          height: 25,
                          decoration: const BoxDecoration(
                            color:
                            background,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-0.77, -1.08),
                        child: Text(
                          'Próximos Alarmes',
                          style: TextStyle(
                            fontFamily: GoogleFonts.inter().fontFamily,
                            color: textColor
                          ),
                        ),
                      ),
                    ],
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