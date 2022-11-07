import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import 'package:smart_mhealth_admin/screens/agendas.dart';
import 'package:smart_mhealth_admin/screens/cadastro_admin.dart';
import 'package:smart_mhealth_admin/screens/cadastro_agenda.dart';
import 'package:smart_mhealth_admin/screens/cadastro_cuidador.dart';
import 'package:smart_mhealth_admin/screens/cadastro_remedio.dart';
import 'package:smart_mhealth_admin/screens/colaboradores.dart';
import 'package:smart_mhealth_admin/screens/criar_alarme.dart';
import 'package:smart_mhealth_admin/screens/listagem_remedios.dart';
import 'package:smart_mhealth_admin/screens/visualizar_remedio.dart';
import 'package:smart_mhealth_admin/screens/login.dart';
import 'package:smart_mhealth_admin/screens/menu.dart';
import 'package:smart_mhealth_admin/screens/meus_cuidados.dart';
import 'package:smart_mhealth_admin/screens/perfil_idoso.dart';
import 'package:smart_mhealth_admin/screens/relatorios.dart';
import 'package:smart_mhealth_admin/screens/perfil_cuidador.dart';
import 'package:smart_mhealth_admin/themes/color.dart';

import 'http/idoso/idoso.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  FlutterDownloader.initialize(
      debug:
          true, // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  runApp(const Smartmhealth());
}

class Smartmhealth extends StatelessWidget {
  const Smartmhealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smartmhealth',
      theme: MyTheme.defaultTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/cadastro_admin': (context) => const CadastroAdmin(),
        '/cadastro_remedio': (context) => const CadastroRemedio(),
        '/listagem_remedios': (context) => const ListagemRemedios(),
        '/menu': (context) => const Menu(),
        '/meus_cuidados': (context) => const MeusCuidados(),
        '/perfil_idoso': (context) => PerfilIdoso(idoso: Idoso()),
        '/agendas': (context) => const Agendas(),
        '/perfil_cuidador': (context) => const PerfilCuidador(),
        '/cadastro_cuidador': (context) => const CadastroCuidador(),
        '/cadastro_agenda': (context) => const CadastroAgenda(),
        '/relatorios': (context) => Relatorios(),
        '/colaboradores': (context) => const Colaboradores(),
        '/visualizar_remedio': (context) =>
            VisualizarRemedio(remedio: Remedio()),
        '/criar_alarme': (context) => CriarAlarme(
              idoso: Idoso(),
            )
      },
    );
  }
}
