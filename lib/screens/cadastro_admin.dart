import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class Cadastro_admin extends StatelessWidget {
  Cadastro_admin({Key? key}) : super(key: key);
  final String image = '../assets/images/logo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      endDrawer: DrawerCustom(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )),
            ),
          ),
          Text(
            'Cadastro',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: GoogleFonts.rampartOne(
              fontSize: 40,
              fontWeight: FontWeight.w400,
              color: MyTheme.defaultTheme.primaryColor,
            ),
          ),
          Text(
            'Nome',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: GoogleFonts.rampartOne(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: MyTheme.defaultTheme.primaryColor,
            ),
          ),
          const Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),
              )
          ),
          const Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
