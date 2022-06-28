import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/components/appbar.dart';
import 'package:smart_mhealth_admin/components/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final String image = '../assets/images/logo.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      endDrawer: DrawerCustom(),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(41.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'O despertador',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rampartOne(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.defaultTheme.primaryColor,
                  ),
                ),
              ),
            ),
            Image.asset('lib/assets/images/Logo_Verde.png'),
            Padding(
              padding: const EdgeInsets.all(41.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Deles',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rampartOne(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.defaultTheme.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
