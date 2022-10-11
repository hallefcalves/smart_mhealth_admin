import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/components/readonly_focus.dart';
import 'package:smart_mhealth_admin/http/idoso/idoso.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class CardIdoso extends StatelessWidget {
  const CardIdoso(this.idoso, {Key? key}) : super(key: key);
  final Idoso idoso;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
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
                    child: Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/images/severinapereira.jpg',
                        scale: 2.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Column(
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          debugPrint('Button pressed ...');
                          /* //a navegação será algo assim
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PerfilIdoso(idoso)));
                      */
                        },
                        text: 'Ver Perfil',
                        options: FFButtonOptions(
                          width: 110,
                          height: 40,
                          color: primaryColor,
                          textStyle: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily),
                          borderRadius: 100,
                        ),
                      ),
                      const Text(
                        " ",
                        style: TextStyle(fontSize: 9),
                      ),
                      FFButtonWidget(
                        onPressed: () {
                          debugPrint('Button pressed ...');
                        },
                        text: '+ Remédios',
                        options: FFButtonOptions(
                          width: 110,
                          height: 40,
                          color: primaryColor,
                          textStyle: TextStyle(
                              fontFamily: GoogleFonts.inter().fontFamily),
                          borderRadius: 100,
                        ),
                      ),
                    ],
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
                    idoso.name ?? 'Severina Pereira',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 24,
                        color: textColor),
                  ),
                ),
                Stack(
                  alignment: const AlignmentDirectional(0.05, 0.05),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-0.3, -0.5),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: TextFormField(
                          maxLines: 10,
                          autofocus: true,
                          readOnly: true,
                          focusNode: new AlwaysEnabledFocusNode(),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Próximos Alarmes',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyTheme.defaultTheme.primaryColor),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: MyTheme.defaultTheme.primaryColor,
                              width: 2,
                            )),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
