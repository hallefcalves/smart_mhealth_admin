import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/box_remedio.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:smart_mhealth_admin/components/readonly_focus.dart';
import 'package:smart_mhealth_admin/screens/criar_alarme.dart';
import 'package:smart_mhealth_admin/screens/editar_perfil_idoso.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/themes/color.dart';
import '../http/idoso/idoso.dart';

class PerfilIdoso extends StatefulWidget {
  const PerfilIdoso({Key? key, required this.idoso}) : super(key: key);
  final Idoso idoso;
  @override
  // ignore: library_private_types_in_public_api
  _PerfilIdoso createState() => _PerfilIdoso();
}

class _PerfilIdoso extends State<PerfilIdoso> {
  @override
  void initState() {
    super.initState();
    nome = widget.idoso.name??"";
    emailController.text = widget.idoso.email??"";
    telefoneController.text = widget.idoso.tel??"";

  }

  String nome = "";
  final String image = 'lib/assets/images/Logo.png';

  //todo: other icons
  final String userIcon =
      '<svg width="34" height="45" viewBox="0 0 34 45" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0.430176 6.16113C0.430176 4.71073 1.00635 3.31973 2.03194 2.29414C3.05753 1.26855 4.44852 0.692383 5.89893 0.692383L27.7739 0.692383C29.2243 0.692383 30.6153 1.26855 31.6409 2.29414C32.6665 3.31973 33.2427 4.71073 33.2427 6.16113V38.9736C33.2427 40.424 32.6665 41.815 31.6409 42.8406C30.6153 43.8662 29.2243 44.4424 27.7739 44.4424H5.89893C4.44852 44.4424 3.05753 43.8662 2.03194 42.8406C1.00635 41.815 0.430176 40.424 0.430176 38.9736V6.16113ZM12.7349 6.16113C12.3723 6.16113 12.0245 6.30518 11.7681 6.56157C11.5117 6.81797 11.3677 7.16572 11.3677 7.52832C11.3677 7.89092 11.5117 8.23867 11.7681 8.49507C12.0245 8.75147 12.3723 8.89551 12.7349 8.89551H20.938C21.3006 8.89551 21.6483 8.75147 21.9047 8.49507C22.1611 8.23867 22.3052 7.89092 22.3052 7.52832C22.3052 7.16572 22.1611 6.81797 21.9047 6.56157C21.6483 6.30518 21.3006 6.16113 20.938 6.16113H12.7349ZM16.8364 30.7705C19.012 30.7705 21.0985 29.9063 22.6369 28.3679C24.1753 26.8295 25.0396 24.743 25.0396 22.5674C25.0396 20.3918 24.1753 18.3053 22.6369 16.7669C21.0985 15.2285 19.012 14.3643 16.8364 14.3643C14.6608 14.3643 12.5743 15.2285 11.0359 16.7669C9.49756 18.3053 8.6333 20.3918 8.6333 22.5674C8.6333 24.743 9.49756 26.8295 11.0359 28.3679C12.5743 29.9063 14.6608 30.7705 16.8364 30.7705ZM30.5083 38.3037C28.1731 35.7607 24.0087 33.5049 16.8364 33.5049C9.66416 33.5049 5.49971 35.7635 3.16455 38.3037V38.9736C3.16455 39.6988 3.45264 40.3943 3.96543 40.9071C4.47823 41.4199 5.17372 41.708 5.89893 41.708H27.7739C28.4991 41.708 29.1946 41.4199 29.7074 40.9071C30.2202 40.3943 30.5083 39.6988 30.5083 38.9736V38.3037Z" fill="#82C5BB"/></svg>';

  TextEditingController emailController = TextEditingController();
  //TextEditingController telefoneController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 35, 0, 5),
            child: Row(mainAxisSize: MainAxisSize.max, children: [
              SizedBox(
                width: 380,
                height: 150,
                child: Align(
                  alignment: const AlignmentDirectional(-1.02, -0.33),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(130, 0, 0, 0),
                    child: Container(
                      width: 130,
                      height: 130,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'lib/assets/images/severinapereira.jpg',
                        scale: 3.0,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Center(
            child: Text(
              nome,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40, 20, 40, 0),
            child: TextFormField(
              readOnly: true,
              controller: emailController,
              autofocus: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'E-mail',
                hintText: 'severina.pereira@exemplo.com',
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
              readOnly: true,
              controller: telefoneController,
              autofocus: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Número de Telefone',
                hintText: '(xx) xxxxx-xxxx',
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
              readOnly: true,
              controller: telefoneController,
              autofocus: true,
              focusNode: AlwaysEnabledFocusNode(),
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Telefone Secundário',
                hintText: '(xx) xxxxx-xxxx',
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
          const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(42, 20, 0, 20),
              child: Text(
                "Remédios: ",
                style: TextStyle(fontSize: 16),
              )),
          const BoxRemedio(),
          const BoxRemedio(),
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(56, 30, 0, 20),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditarPerfilIdoso(),
                                  ),
                                )
                              },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  MyTheme.defaultTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 15)),
                          child: const Text('Editar')),
                      const Text("   "),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                         CriarAlarme(idoso: widget.idoso,),
                                  ),
                                )
                              },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  MyTheme.defaultTheme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 15)),
                          child: const Text('+ Remédio')),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  realizaCadastro() async {
    /*var dadosIdoso = Idoso();
    //dadosIdoso.senha = passwordController.text;
    dadosIdoso.email = emailController.text;
    //dadosIdoso.name = nameController.text;
    //todo obter id do cuidador logado
    //
    /*dynamic user = await SessionManager().get("user");
    dadosIdoso.refCuidador = Cuidador.obtemIdSession(user.toString());*/
    Cuidador user = await Sessao.obterUser();
    dadosIdoso.refCuidador = user.id;
    criaIdoso(dadosIdoso).then((value) => showDialog<void>(
        context: context,
        builder: (context) => CustomAlertDialog(
            "Sucesso",
            "Criado com sucesso",
            "Ok",
            "",
            const IconData(0x41, fontFamily: 'Roboto'),
            navegaConclui)));*/
  }

  navegaConclui() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MeusCuidados()));
  }
}
