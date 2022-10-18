import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/components/flutter_flow_widgets.dart';
import 'package:smart_mhealth_admin/http/alarme/alarme.dart';
import 'package:smart_mhealth_admin/http/ingestao_remedio/ingestao_remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/web_remedio.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../http/agenda/agenda.dart';
import '../http/ingestao_remedio/web_ingestao_remedio.dart';

class BoxRemedio extends StatelessWidget {
  const BoxRemedio(this.alarme, {Key? key}) : super(key: key);
  final Alarme alarme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(38, 0, 38, 10),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border:
                Border.all(color: MyTheme.defaultTheme.primaryColor, width: 2)),
        child: Stack(
          children: [
            Align(
                alignment: const AlignmentDirectional(-0.85, 0),
                child: FutureBuilder(
              future: carregaNomeRemedio(),
              initialData : "[]",
              builder: (context, AsyncSnapshot<String?> snapshot) {
                return Text(snapshot.data??"");
              }
        ))]
      ),
    ));
  }

  Future<String?> carregaNomeRemedio() async{
    String? rjson =  await obtemRemedioIngestao(alarme.refRemedio);
    RemedioIngestao r = RemedioIngestao.obtemRemedioIngestao(rjson);
    return r.name; 
  }

}
