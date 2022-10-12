import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/http/agenda/agenda.dart';
import 'package:smart_mhealth_admin/http/agenda/web_agenda.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_mhealth_admin/util/util_datas.dart';

import '../components/alertdialog.dart';
import '../http/cuidador/cuidador.dart';
import '../util/sessao.dart';

class CadastroAgenda extends StatefulWidget {
  const CadastroAgenda({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CadastroAgenda createState() => _CadastroAgenda();
}

class _CadastroAgenda extends State<CadastroAgenda> {
  @override
  void initState() {
    super.initState();
  }
  
  TextEditingController horaInController = TextEditingController();
  TextEditingController minInController = TextEditingController();
  TextEditingController horaFrequenciaController = TextEditingController();
  TextEditingController minsFrequenciaController = TextEditingController();
  TextEditingController minutosAdiarController = TextEditingController();
  TextEditingController repeticoesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'Nova Agenda',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.defaultTheme.primaryColor,
                ),
              ),
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
            child: Text(
              "Toda Seg - Qua - Sex - Dom\n\n"
              "De x em x horas\n\n"
              "Começando às xxhxx\n\n",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyTheme.defaultTheme.primaryColor,
                height: 0.8,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: MyTheme.defaultTheme.primaryColor, width: 2)),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.9, -1.60),
                    child: Container(
                      width: 100,
                      height: 20,
                      color: MyTheme.defaultTheme.backgroundColor,
                      child: const Text(
                        " Horário de Início",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: FaIcon(FontAwesomeIcons.clock),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.2, 0),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField(
                        controller: horaInController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '00',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      ":",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.2, 0),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField(
                        controller: minInController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '00',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: MyTheme.defaultTheme.primaryColor, width: 2)),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.9, -1.60),
                    child: Container(
                      width: 70,
                      height: 20,
                      color: MyTheme.defaultTheme.backgroundColor,
                      child: const Text(
                        " Frequência",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: FaIcon(FontAwesomeIcons.clock),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.2, 0),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField(
                        controller: horaFrequenciaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '00',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      ":",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.2, 0),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField(
                        controller: minsFrequenciaController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '00',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.7, 0),
                    child: FaIcon(FontAwesomeIcons.calendar),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: MyTheme.defaultTheme.primaryColor, width: 2)),
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.9, -1.60),
                    child: Container(
                      width: 125,
                      height: 20,
                      color: MyTheme.defaultTheme.backgroundColor,
                      child: const Text(
                        " Função adiar alarme",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.8, 0),
                    child: Text("Repetir", style: TextStyle(fontSize: 12)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-0.45, 0),
                    child: SizedBox(
                      width: 36,
                      height: 30,
                      child: TextField(
                        controller: repeticoesController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '0',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child:
                        Text("vezes, a cada", style: TextStyle(fontSize: 12)),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.45, 0),
                    child: SizedBox(
                      width: 45,
                      height: 30,
                      child: TextField(
                        controller: minutosAdiarController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          alignLabelWithHint: false,
                          hintText: '00',
                          hintStyle: GoogleFonts.roboto(
                            fontSize: 18,
                            height: 0.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(0.7, 0),
                    child: Text("min", style: TextStyle(fontSize: 12)),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {
              realizaCadastro()
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyTheme.defaultTheme.primaryColor,
              minimumSize: const Size(80, 40),
              maximumSize: const Size(80, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Concluir'),
          ),
        ],
      ),
    );
  }

  
  realizaCadastro() async {
    var dadosAgenda = Agenda();

    dadosAgenda.frequencia = UtilDatas.horaParaData(
      int.parse(horaFrequenciaController.text), int.parse(minsFrequenciaController.text));

    dadosAgenda.horarioInicio = UtilDatas.horaParaData(
      int.parse(horaInController.text),int.parse(minInController.text));

    dadosAgenda.minutosAdiar = int.parse(minutosAdiarController.text);
    dadosAgenda.repeticoesAdiar = int.parse(repeticoesController.text);
    Cuidador user = await Sessao.obterUser();
    dadosAgenda.refCuidador = user.id;

    criaAgenda(dadosAgenda);
    showDialog<void>(
        context: context,
        builder: (context) => CustomAlertDialog("Cadastrado", "Sucesso ao cadastrar!", "confirma",
            "", const IconData(0x41, fontFamily: 'Roboto'), navegaConclui));
    
  }

  navegaConclui(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Agendas()));
  }

}
