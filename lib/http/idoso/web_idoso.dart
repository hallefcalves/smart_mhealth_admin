import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/idoso/idoso.dart';
import 'package:smart_mhealth_admin/http/web.dart';

Future<String?> obtemIdoso(id) async {
  return Orion.obtemDados(id);
}

Future<String?> obtemListaIdosos(idCuidador) async {
  return Orion.obtemDadosQuery('?type=idoso&refCuidador=$idCuidador');
}

alteraIdoso(dadosIdoso) async {
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
}

criaIdoso(dadosIdoso) async {
  return Orion.criaEntidade(Idoso.obtemJson(dadosIdoso));
}

deletaIdoso(id) async {
  return Orion.deletaEntidade(id, "idoso");
}



/*criaIdoso(dadosIdoso) async {
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




