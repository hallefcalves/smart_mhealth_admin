import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import '../flutter_flow/flutter_flow_util.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/http/agenda/agenda.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardAgendas extends StatelessWidget {
  CardAgendas(this.agenda, {Key? key}) : super(key: key);
  Agenda agenda;
  static const IconData mode_edit_rounded =
      IconData(0xf8ca, fontFamily: 'MaterialIcons');

  //Texto que virá da criação de agendas
  final String txtAgenda = "Todos os dias\n\n"
      "de 4h em 4h\n\n"
      "começando às 08h00\n\n";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(60, 10, 0, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  width: 280,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0x41B9DFD9),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: Color(0xFF82C5BB),
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.70, 1.0),
                        child: Text(txtAgenda,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 14,
                                height:
                                    0.5 //You can set your custom height here
                                )),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.94, 0.6),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: FaIcon(
                            FontAwesomeIcons.trash,
                            color: MyTheme.defaultTheme.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.94, -0.65),
                        child: Container(
                          width: 20,
                          height: 20,
                          child: FaIcon(
                            FontAwesomeIcons.edit,
                            color: MyTheme.defaultTheme.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
