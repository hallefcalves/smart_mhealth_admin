
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';

class Sessao {
  static salvarUser(){

  }

  static Future<Cuidador> obterUser() async {
    dynamic user = await SessionManager().get("user");
    Cuidador usuario = Cuidador.obtemCuidador(user.toString());
    return usuario;
  }

  static Cuidador obterUserTeste() {
    dynamic user = SessionManager().get("user");
    Cuidador usuario = Cuidador.obtemCuidador(user.toString());
    return usuario;
  }

}
