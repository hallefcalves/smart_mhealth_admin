
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
