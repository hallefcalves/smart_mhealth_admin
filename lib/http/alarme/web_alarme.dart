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

criaAlarme(idIdoso, idAgenda, Remedio remedio) async {
  //tbm cadastra copia remedio
  String idRemedioNovo = "urn:ngsi-ld:remedio:${Orion.createUniqueId()}";
  criaRemedioIngestaoComBase(remedio, idIdoso, idRemedioNovo);
  Alarme alarme = Alarme();
  alarme.refAgenda = idAgenda;
  alarme.refIdoso = idIdoso;
  alarme.refRemedio = idRemedioNovo;
  alarme.tentativas = 0;
  //alarme.ultimoConsumo = "";
  return Orion.criaEntidade(Alarme.obtemJson(alarme));
}

deletaAlarme(id) async {
  return Orion.deletaEntidade(id, "alarme");
}