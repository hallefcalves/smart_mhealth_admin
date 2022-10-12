
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';

class UtilDatas {
  static DateTime horaParaData(int hora, int min) {
    return DateTime.utc(0, 1, 1, hora, min);
  }

  static String obtemStringHora(data) {
    DateTime d = data;
    String minStr = d.minute==0?"":d.minute.toString();
    return "${d.hour}h$minStr";
  }

}
