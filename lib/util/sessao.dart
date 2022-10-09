
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';

class Sessao {
  static salvarUser(jsonUser) async {
    await SessionManager().set("user", "-$jsonUser");
  }

  static Future<Cuidador> obterUser() async {
    dynamic user = await SessionManager().get("user");
    Cuidador usuario = Cuidador.obtemCuidador(user.toString().substring(1));
    return usuario;
  }

  static Future<void> logOff() async {
    await SessionManager().remove("user");
  }

}
