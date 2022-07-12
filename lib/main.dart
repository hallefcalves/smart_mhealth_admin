import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/screens/cadastro_admin.dart';
import 'package:smart_mhealth_admin/screens/cadastro_agenda.dart';
import 'package:smart_mhealth_admin/screens/cadastro_colaborador.dart';
import 'package:smart_mhealth_admin/screens/cadastro_remedio.dart';
import 'package:smart_mhealth_admin/screens/ler_codigo_barras.dart';
import 'package:smart_mhealth_admin/screens/colaboradores.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/screens/login.dart';
import 'package:smart_mhealth_admin/screens/menu.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/screens/perfil_idoso.dart';
import 'package:smart_mhealth_admin/screens/relatorios.dart';
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
        '/cadastro_remedio': (context) => Cadastro_remedio(),
        '/listagem_remedios': (context) => Listagem_remedios(),
        '/menu': (context) => Menu(),
        '/meus_cuidados': (context) => Meus_cuidados(),
        '/perfil_idoso': (context) => Perfil_idoso(),
        '/agendas': (context) => Agendas(),
        '/ler_codigo_barras': (context) => Ler_codigo_barras(),
        '/cadastro_colaborador': (context) => Cadastro_colaborador(),
        '/cadastro_agenda': (context) => Cadastro_agenda(),
        '/agendas': (context) => Agendas(),
        '/relatorios': (context) => Relatorios(),
        '/colaboradores': (context) => Colaboradores()
      },
    );
  }
}
