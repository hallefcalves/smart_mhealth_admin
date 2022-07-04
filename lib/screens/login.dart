import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/screens/cadastro_idoso.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  final String image = 'lib/assets/images/Logo_Verde.png';
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
                'O despertador',
                style: GoogleFonts.rampartOne(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: MyTheme.defaultTheme.primaryColor,
                ),
              ),
            ),
          ),
          Center(
            child: Image.asset(
              image,
              scale: 2.2,
            ),
          ),
          Center(
            child: Text(
              'Deles',
              style: GoogleFonts.rampartOne(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: MyTheme.defaultTheme.primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextField(
              decoration: InputDecoration(
                alignLabelWithHint: false,
                hintText: 'joao.silva@exemplo.com',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                labelText: 'E-mail ou Telefone',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25.0),
            child: TextField(
              decoration: InputDecoration(
                alignLabelWithHint: false,
                hintText: '**************',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                labelText: 'Senha',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              textDirection: TextDirection.ltr,
              style: GoogleFonts.roboto(
                fontSize: 12,
              ),
              'Esqueceu a Senha?',
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ElevatedButton.styleFrom(
              primary: MyTheme.defaultTheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Login'),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Cadastro_idoso(),
                ),
              ),
            },
            style: ElevatedButton.styleFrom(
              primary: MyTheme.defaultTheme.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
