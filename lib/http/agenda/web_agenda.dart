import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/agenda/agenda.dart';
import 'package:smart_mhealth_admin/http/idoso/idoso.dart';
import 'package:smart_mhealth_admin/http/web.dart';

Future<String?> obtemAgenda(id) async {
  return Orion.obtemDados(id);
}

Future<String?> obtemListaAgendas(idCuidador) async {
  return Orion.obtemDadosQuery('?type=agenda&q=refCuidador==$idCuidador');
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

criaAgenda(dadosAgenda) async {
  return Orion.criaEntidade(Agenda.obtemJson(dadosAgenda));
}

deletaAgenda(id) async {
  return Orion.deletaEntidade(id, "agenda");
}