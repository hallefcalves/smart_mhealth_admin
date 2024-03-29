import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/barcodescanner.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:smart_mhealth_admin/components/readonly_focus.dart';
import 'package:smart_mhealth_admin/http/external_api.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/web_remedio.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import '../globals.dart' as globals;
import '../components/alertdialog.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';

class VisualizarRemedio extends StatefulWidget {
  const VisualizarRemedio({Key? key, required this.remedio}) : super(key: key);
  final Remedio remedio;

  @override
  // ignore: library_private_types_in_public_api
  _VisualizarRemedio createState() => _VisualizarRemedio();
}

class _VisualizarRemedio extends State<VisualizarRemedio> {
  final ReceivePort _port = ReceivePort();
  @override
  initState() {
    super.initState();
    nameController.addListener(_checkIfFieldIsEmpty);
    qtdController.addListener(_checkIfFieldIsEmpty);
    nameController.text = widget.remedio.name ?? "err";
    dataValidadeController.text = widget.remedio.dataValidade ?? "";
    loteController.text = widget.remedio.lote ?? "err";
    qtdController.text = widget.remedio.qtdPilulas.toString();

    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _checkIfFieldIsEmpty listener.
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  _checkIfFieldIsEmpty() {
    if (globals.remedioNome != '' && globals.qtd != '') {
      nameController.text = globals.remedioNome;
      qtdController.text = globals.qtd;
    }
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    if (kDebugMode) {
      print(
          'Background Isolate Callback: task ($id) is in status ($status) and process ($progress)');
    }
    final SendPort send =
        IsolateNameServer.lookupPortByName('downloader_send_port')!;
    send.send([id, status, progress]);
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
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 10),
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Center(
                  child: Text(
                nameController.text,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ))),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: TextFormField(
              readOnly: true,
              controller: nameController,
              autofocus: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Princípio Ativo',
                hintText: 'ATORVASTINA CALCICA',
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
            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 10, 0),
                    child: TextFormField(
                      controller: dataValidadeController,
                      autofocus: true,
                      readOnly: true,
                      focusNode: AlwaysEnabledFocusNode(),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Data de Validade',
                        hintText: '01/01/25',
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
                      controller: loteController,
                      autofocus: true,
                      readOnly: true,
                      focusNode: AlwaysEnabledFocusNode(),
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Lote',
                        hintText: 'AR0000',
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
            padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
            child: TextFormField(
              //controller: nameController,
              autofocus: true,
              readOnly: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Tipo de Remédio',
                hintText: '30 Comprimidos Revestidos',
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
            child: TextFormField(
              //controller: nameController,
              autofocus: true,
              readOnly: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Fabricante',
                hintText: 'Sanofi Medley Farmacêutica Ltda.',
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
            child: TextFormField(
              //controller: nameController,
              autofocus: true,
              maxLines: 5,
              readOnly: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Mensagem',
                hintText: 'Texto',
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
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.9, -1.60),
                  child: TextFormField(
                    //controller: nameController,
                    autofocus: true,
                    readOnly: true,
                    focusNode: AlwaysEnabledFocusNode(),
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Bula',
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
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(1, 5, 0, 0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => {_baixaBula(nameController.text)},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        child: const Text(
                          'Acesse a bula em PDF aqui',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(50, 0, 0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.filePdf,
                          color: MyTheme.defaultTheme.primaryColor,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => {
                  deletaRemedio(widget.remedio.id).then((value) =>
                      showDialog<void>(
                          context: context,
                          builder: (context) => CustomAlertDialog(
                              "Deletado",
                              "Deletado com sucesso",
                              "Ok",
                              "",
                              const IconData(0x41, fontFamily: 'Roboto'),
                              navegaConclui)))
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.defaultTheme.errorColor,
                  minimumSize: const Size(90, 40),
                  maximumSize: const Size(90, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Excluir'),
              ),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                onPressed: () => {navegaConclui()},
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.defaultTheme.primaryColor,
                  minimumSize: const Size(90, 40),
                  maximumSize: const Size(90, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Concluir'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  navegaConclui() {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const ListagemRemedios())));
  }
}

_baixaBula(text) async {
  var url = await procurarBula(text);
  if (await Permission.storage.request().isGranted) {
    await FlutterDownloader.enqueue(
      url: url,
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: '/storage/emulated/0/Download/',
      fileName: 'Bula$text.pdf',
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification: true,
    ); // click on notification to open downloaded file (for Android)
  } else {
    debugPrint('Permission Denied');
  }
}
