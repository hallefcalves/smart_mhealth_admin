import 'package:smart_mhealth_admin/http/agenda/agenda.dart';
import 'package:smart_mhealth_admin/http/idoso/idoso.dart';
import 'package:smart_mhealth_admin/http/web.dart';

import '../ingestao_remedio/web_ingestao_remedio.dart';
import '../remedio/remedio.dart';
import 'alarme.dart';

Future<String?> obtemAlarme(id) async {
  return Orion.obtemDados(id);
}

Future<String?> obtemListaAlarme(idIdoso) async {
  return Orion.obtemDadosQuery('?type=alarme&q=refIdoso==$idIdoso');
}

/*alteraIdoso(dadosIdoso) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Idoso.obtemJson(dadosIdoso);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => print(value));
  } else {
    print(response.reasonPhrase);
  }
}*/

criaAlarme(idIdoso, Remedio remedio, Agenda agenda) async {
  //tbm cadastra copia remedio
  criaRemedioIngestaoComBase(remedio, idIdoso);
  Alarme alarme = Alarme();
  alarme.refAgenda = agenda.id;
  alarme.refIdoso = idIdoso;
  alarme.refRemedio = remedio.id;
  alarme.tentativas = 0;
  //alarme.ultimoConsumo = "";
  return Orion.criaEntidade(Agenda.obtemJson(alarme));
}

deletaAlarme(id) async {
  return Orion.deletaEntidade(id, "alarme");
}