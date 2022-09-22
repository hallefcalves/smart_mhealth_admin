import 'package:flutter/material.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/screens/cadastro_admin.dart';
import 'package:smart_mhealth_admin/screens/cadastro_agenda.dart';
import 'package:smart_mhealth_admin/screens/cadastro_cuidador.dart';
import 'package:smart_mhealth_admin/screens/cadastro_remedio.dart';
import 'package:smart_mhealth_admin/screens/ler_codigo_barras.dart';
import 'package:smart_mhealth_admin/screens/colaboradores.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/screens/login.dart';
import 'package:smart_mhealth_admin/screens/menu.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/screens/perfil_idoso.dart';
import 'package:smart_mhealth_admin/screens/relatorios.dart';
import 'package:smart_mhealth_admin/screens/perfil_cuidador.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

void main() => runApp(const Smartmhealth());

class Smartmhealth extends StatelessWidget {
  const Smartmhealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartmhealth',
      theme: MyTheme.defaultTheme,
      initialRoute: '/cadastro_cuidador',
      routes: {
        '/': (context) => const Login(),
        '/cadastro_admin': (context) => const CadastroAdmin(),
        '/cadastro_remedio': (context) =>  CadastroRemedio(),
        '/listagem_remedios': (context) => const ListagemRemedios(),
        '/menu': (context) => const Menu(),
        '/meus_cuidados': (context) => const MeusCuidados(),
        '/perfil_idoso': (context) => const PerfilIdoso(),
        '/agendas': (context) => const Agendas(),
        '/perfil_cuidador': (context) => const PerfilCuidador(),
        '/ler_codigo_barras': (context) => const LerCodigoBarras(),
        '/cadastro_cuidador': (context) => const CadastroCuidador(),
        '/cadastro_agenda': (context) => const CadastroAgenda(),
        '/relatorios': (context) =>  Relatorios(),
        '/colaboradores': (context) => const Colaboradores()
      },
    );
  }
}