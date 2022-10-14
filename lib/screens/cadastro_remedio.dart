import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/barcodescanner.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/web_remedio.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../globals.dart' as globals;
import '../components/alertdialog.dart';
import '../util/sessao.dart';

class CadastroRemedio extends StatefulWidget {
  const CadastroRemedio({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CadastroRemedio createState() => _CadastroRemedio();
}

class _CadastroRemedio extends State<CadastroRemedio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _checkIfFieldIsEmpty listener.
    nameController.dispose();
    qtdController.dispose();
    globals.remedioNome = '';
    globals.qtd = '';
    super.dispose();
  }

  _checkIfFieldIsEmpty() {
    if (globals.remedioNome != '' && globals.qtd != '') {
      nameController.text = globals.remedioNome;
      qtdController.text = globals.qtd;
      setState(() {});
    }
  }

  final String image = 'lib/assets/images/Logo.png';
  final int gtin = 7891203059413;
  String data = "unknown";
  //todo: other icons
  final String userIcon =
      '<svg width="34" height="45" viewBox="0 0 34 45" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0.430176 6.16113C0.430176 4.71073 1.00635 3.31973 2.03194 2.29414C3.05753 1.26855 4.44852 0.692383 5.89893 0.692383L27.7739 0.692383C29.2243 0.692383 30.6153 1.26855 31.6409 2.29414C32.6665 3.31973 33.2427 4.71073 33.2427 6.16113V38.9736C33.2427 40.424 32.6665 41.815 31.6409 42.8406C30.6153 43.8662 29.2243 44.4424 27.7739 44.4424H5.89893C4.44852 44.4424 3.05753 43.8662 2.03194 42.8406C1.00635 41.815 0.430176 40.424 0.430176 38.9736V6.16113ZM12.7349 6.16113C12.3723 6.16113 12.0245 6.30518 11.7681 6.56157C11.5117 6.81797 11.3677 7.16572 11.3677 7.52832C11.3677 7.89092 11.5117 8.23867 11.7681 8.49507C12.0245 8.75147 12.3723 8.89551 12.7349 8.89551H20.938C21.3006 8.89551 21.6483 8.75147 21.9047 8.49507C22.1611 8.23867 22.3052 7.89092 22.3052 7.52832C22.3052 7.16572 22.1611 6.81797 21.9047 6.56157C21.6483 6.30518 21.3006 6.16113 20.938 6.16113H12.7349ZM16.8364 30.7705C19.012 30.7705 21.0985 29.9063 22.6369 28.3679C24.1753 26.8295 25.0396 24.743 25.0396 22.5674C25.0396 20.3918 24.1753 18.3053 22.6369 16.7669C21.0985 15.2285 19.012 14.3643 16.8364 14.3643C14.6608 14.3643 12.5743 15.2285 11.0359 16.7669C9.49756 18.3053 8.6333 20.3918 8.6333 22.5674C8.6333 24.743 9.49756 26.8295 11.0359 28.3679C12.5743 29.9063 14.6608 30.7705 16.8364 30.7705ZM30.5083 38.3037C28.1731 35.7607 24.0087 33.5049 16.8364 33.5049C9.66416 33.5049 5.49971 35.7635 3.16455 38.3037V38.9736C3.16455 39.6988 3.45264 40.3943 3.96543 40.9071C4.47823 41.4199 5.17372 41.708 5.89893 41.708H27.7739C28.4991 41.708 29.1946 41.4199 29.7074 40.9071C30.2202 40.3943 30.5083 39.6988 30.5083 38.9736V38.3037Z" fill="#82C5BB"/></svg>';

  TextEditingController nameController = TextEditingController();
  TextEditingController dataValidadeController = TextEditingController();
  //TextEditingController telefoneController = TextEditingController();
  TextEditingController loteController = TextEditingController();
  TextEditingController qtdController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  BarcodeScanner scan = BarcodeScanner();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
              child: Card(
                color: Colors.white,
                child: InkWell(
                  onTap: () async =>
                      {await scan.scanBarcodeNormal(), _checkIfFieldIsEmpty()},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 35,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 15, 0),
                                child: Text(
                                  'Novo Remédio',
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                'Ler código de barra',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ]),
                          ],
                        ),
                        Icon(
                          FontAwesomeIcons.chevronRight,
                          color: MyTheme.defaultTheme.primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 35),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(
                width: 270,
                height: 160,
                child: Stack(
                  children: [
                    Center(
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              110, 0, 0, 5),
                          child: Container(
                            width: 180,
                            height: 180,
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
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.02, 0.93),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              215, 0, 0, 5),
                          child: Icon(
                            Icons.camera_alt,
                            color: MyTheme.defaultTheme.primaryColor,
                            size: 35,
                          )),
                    ),
                  ],
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: TextFormField(
              controller: nameController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Nome do remédio',
                hintText: 'Paracetamol',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyTheme.defaultTheme.primaryColor),
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
            child: TextField(
              controller: dataValidadeController,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Data de validade',
                hintText: '01/01/2023',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyTheme.defaultTheme.primaryColor),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: MyTheme.defaultTheme.primaryColor,
                  width: 1.5,
                )),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                    child: TextFormField(
                      controller: loteController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Lote',
                        hintText: 'AR0000',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyTheme.defaultTheme.primaryColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyTheme.defaultTheme.primaryColor,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 0, 0),
                    child: TextFormField(
                      controller: qtdController,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        hintText: '100 ml',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyTheme.defaultTheme.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: MyTheme.defaultTheme.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 170, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListagemRemedios(),
                    ),
                  )
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.transparent,
                    shadowColor: Colors.transparent),
                child: const Text(
                  'Onde encontrar o lote?',
                  style: TextStyle(
                      color: Colors.grey, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: TextFormField(
              autofocus: true,
              obscureText: false,
              maxLines: 3,
              controller: msgController,
              decoration: InputDecoration(
                labelText: 'Deixe uma mensagem',
                hintText: 'Mensagem',
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: MyTheme.defaultTheme.primaryColor),
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(130, 20, 130, 0),
            child: ElevatedButton(
              onPressed: () => {realizaCadastro(context)},
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
          ),
        ],
      ),
    );
  }

  realizaCadastro(context) async {
    var dadosRemedio = Remedio();

    dadosRemedio.name = nameController.text;
    dadosRemedio.dataValidade = dataValidadeController.text;
    dadosRemedio.lote = loteController.text;
    dadosRemedio.qtdPilulas = qtdController.text;
    dadosRemedio.mensagem = msgController.text;

    Cuidador user = await Sessao.obterUser();
    dadosRemedio.refCuidador = user.id;
    globals.qtd = '';
    globals.remedioNome = '';
    criaRemedio(dadosRemedio).then((value) => showDialog<void>(
        context: context,
        builder: (context) => CustomAlertDialog(
            "Sucesso",
            "Criado com sucesso",
            "Ok",
            "",
            const IconData(0x41, fontFamily: 'Roboto'),
            navegaConclui)));
  }

  navegaConclui() {
    super.dispose();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ListagemRemedios(),
        ));
  }
}
