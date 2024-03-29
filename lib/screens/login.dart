import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:colorful_iconify_flutter/icons/flat_color_icons.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/components/logo.dart';
import 'package:smart_mhealth_admin/screens/cadastro_cuidador.dart';
import 'package:smart_mhealth_admin/screens/menu.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

import '../components/alertdialog.dart';
import '../http/cuidador/cuidador.dart';
import '../http/cuidador/web_cuidador.dart';
import '../util/sessao.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 30),
          Center(child: Transform.scale(scale: 1.1, child: const LogoDeles())),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(
                top: 26.0, right: 28.0, left: 29.0, bottom: 15.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                height: 0.8,
              ),
              controller: emailController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: false,
                hintText: 'joao.silva@exemplo.com',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                labelText: 'E-mail ou Telefone',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 28.0, left: 28.0),
            child: TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              style: const TextStyle(
                height: 0.8,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: false,
                hintText: '**************',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                labelText: 'Senha',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0, left: 30.0),
            child: InkWell(
              child: Text(
                textDirection: TextDirection.ltr,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                ),
                'Esqueceu a Senha?',
              ),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 28.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () => realizaLogin(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.defaultTheme.primaryColor,
                  minimumSize: const Size(80, 40),
                  maximumSize: const Size(80, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Login'),
              ),
            ),
          ),
          Row(children: <Widget>[
            const Expanded(child: Divider()),
            Text("Ou", style: GoogleFonts.roboto(fontSize: 14)),
            const Expanded(child: Divider()),
          ]),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Center(
              child: Text(
                'continue com',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () => {},
                label: const Text('Facebook'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: MyTheme.defaultTheme.primaryColor,
                  backgroundColor: MyTheme.defaultTheme.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: MyTheme.defaultTheme.colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton.icon(
                onPressed: () => {},
                label: const Text('Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: MyTheme.defaultTheme.primaryColor,
                  backgroundColor: MyTheme.defaultTheme.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                ),
                icon: const Iconify(
                  FlatColorIcons.google,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 28.0,
              left: 70.0,
              right: 70.0,
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CadastroCuidador(),
                    ),
                  ),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyTheme.defaultTheme.primaryColor,
                ),
                child: const Text('Não tem uma conta? Cadastre-se'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  realizaLogin() async {
    //var dadosCuidador = Cuidador();
    debugPrint('logando...');
    var senha = passwordController.text;
    //dadosCuidador.email = emailController.text;
    /*Cuidador c = Sessao.obterUserTeste();

    CustomAlertDialog(c.name??"vazio", "sucesso", "confirma",
            "voltar", IconData(0x41, fontFamily: 'Roboto'));*/

    /*obtemCuidadorPorEmail(emailController.text).then((value) => 
    {
      validaUserObtido(value, senha)
    });*/

    String? jsonUser = await obtemCuidadorPorEmail(emailController.text);
    //debugPrint(jsonUser);
    Cuidador c = Cuidador.obtemCuidador(jsonUser);
    if (c.senha == senha) {
      showDialog<void>(
          context: context,
          builder: (context) => CustomAlertDialog(
              "Logado com sucesso",
              "sucesso",
              "ok",
              "",
              const IconData(0x41, fontFamily: 'Roboto'),
              navegaConclui));
      Sessao.salvarUser(jsonUser);
    } else {
      showDialog<void>(
          context: context,
          builder: (context) => const CustomAlertDialog(
              "Falha com login",
              "Inválido",
              "ok",
              "",
              IconData(0x41, fontFamily: 'Roboto'),
              null));
    }

    //   Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const Menu()));
  }

  navegaConclui() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Menu()));
  }
  /*validaUserObtido(String? value, String senha) async {
    Cuidador c = Cuidador.obtemCuidador(value);
    print(value);
    print(c.senha);
    print(senha);
    if(c.senha == senha){
        const CustomAlertDialog("Logado com sucesso", "sucesso", "confirma",
            "voltar", IconData(0x41, fontFamily: 'Roboto'));
        Sessao.salvarUser(value);
    }
    else{
         const CustomAlertDialog("Falha com login", "Inválido", "ok",
            "voltar", IconData(0x41, fontFamily: 'Roboto'));
    }
  }*/

}
