import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class CadastroAgenda extends StatelessWidget {
  const CadastroAgenda({Key? key}) : super(key: key);

  //todo: other icons

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
          ElevatedButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Agendas()))
            }, //popuc code e others
            style: ElevatedButton.styleFrom(
              primary: MyTheme.defaultTheme.primaryColor,
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
}
