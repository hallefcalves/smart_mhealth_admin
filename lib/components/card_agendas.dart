import 'package:flutter/material.dart';
//import '../flutter_flow/flutter_flow_util.dart';
// ignore: unused_import
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/http/agenda/agenda.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../util/util_datas.dart';

class CardAgendas extends StatefulWidget {
  const CardAgendas({Key? key, required this.agenda}) : super(key: key);
  final Agenda agenda;
  @override
  // ignore: library_private_types_in_public_api
  _CardAgendas createState() => _CardAgendas();
}

class _CardAgendas extends State<CardAgendas> {
  @override
  void initState() {
    super.initState();
    String txtFreq = UtilDatas.obtemStringHora(widget.agenda.frequencia);
    String txtIni = UtilDatas.obtemStringHora(widget.agenda.horarioInicio);

    txtAgenda = "Todos os dias\n\n"
      "de $txtFreq em $txtFreq\n\n"
      "começando às $txtIni\n\n";
  }
  final IconData modeEditRounded =
      const IconData(0xf8ca, fontFamily: 'MaterialIcons');

  //Texto que virá da criação de agendas
  String txtAgenda = "";

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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Container(
                  width: 280,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0x41B9DFD9),
                    borderRadius: BorderRadius.circular(3),
                    border: Border.all(
                      color: const Color(0xFF82C5BB),
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-0.70, 1.0),
                        child: Text(txtAgenda,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 14,
                                height:
                                    0.5 //You can set your custom height here
                                )),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.94, 0.6),
                        child: SizedBox(
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
                        alignment: const AlignmentDirectional(0.94, -0.65),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: FaIcon(
                            FontAwesomeIcons.penToSquare,
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
