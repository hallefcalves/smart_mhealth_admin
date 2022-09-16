import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';
import 'package:smart_mhealth_admin/http/web.dart';

Future<String?> obtemCuidador(id) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/$id'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    print(response.reasonPhrase);
  }
  return null;
}

alteraCuidador(dadosCuidador) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Cuidador.obtemJson(dadosCuidador);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => print(value));
  } else {
    print(response.reasonPhrase);
  }
}

//todo: check
criaCuidador(dadosCuidador) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Cuidador.obtemJson(dadosCuidador);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => print(value));
  } else {
    print(response.reasonPhrase);
  }
}

deletaCuidador(id) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('DELETE', Uri.parse('http://${Orion.url}:1026/v2/entities/?q=id==$id&type=remedio'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => print(value));
  } else {
    print(response.reasonPhrase);
  }
}





