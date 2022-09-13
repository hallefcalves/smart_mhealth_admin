import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

import '../screens/cadastro_remedio.dart';

class CardRemedio extends StatelessWidget {
  CardRemedio(this.remedio, {Key? key}) : super(key: key);
  var remedio = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 48, 0, 48),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        183, 0, 0, 0),
                    child: Text(
                      'Paracetamol 10mg',
                      style: TextStyle(
                          fontFamily: GoogleFonts
                              .inter()
                              .fontFamily,
                          fontSize: 20,
                          color: textColor
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.02, -0.33),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20, 0, 0, 0),
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
                  alignment: const AlignmentDirectional(0.72, 0.60),
                  child: FFButtonWidget(
                      onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CadastroRemedio()))
                      },
                    text: '+ Mais informações',
                    options: FFButtonOptions(
                      width: 160,
                      height: 30,
                      color: Colors.white,
                      textStyle: TextStyle(
                          fontFamily: GoogleFonts
                              .inter()
                              .fontFamily,
                          color: primaryColor
                      ),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        105, 0, 0, 5),
                    child: Container(
                      width: 45,
                      height: 45,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        'https://picsum.photos/seed/16/600',
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(7.21, -0.11),
                  child: Text(
                    'Atorvastatina',
                    style:
                    TextStyle(
                        fontFamily: GoogleFonts
                            .inter()
                            .fontFamily,
                        color: textColor
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