import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:smart_mhealth_admin/components/logo.dart';
import 'package:smart_mhealth_admin/screens/cadastro_idoso.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      endDrawer: const DrawerCustom(),
      body: ListView(
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: const LogoDeles()),
          const SizedBox(height: 47),
          SizedBox(
            width: 260,
            height: 200,
          ),
          Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Dashboard',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rampartOne(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Bem-vindo',
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rampartOne(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.defaultTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroIdoso()),
                );
              },
              icon: Icon(
                Icons.add,
                color: MyTheme.defaultTheme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
