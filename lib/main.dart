import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/screens/cadastro_admin.dart';
import 'package:smart_mhealth_admin/screens/login.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

void main() => runApp(const Smartmhealth());

class Smartmhealth extends StatelessWidget {
  const Smartmhealth({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartmhealth',
      theme: MyTheme.defaultTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/cadastro_admin': (context) => Cadastro_admin(),
      },
    );
  }
}
