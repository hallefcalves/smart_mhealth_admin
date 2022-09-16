import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/idoso/idoso.dart';
import 'package:smart_mhealth_admin/http/web.dart';

Future<String?> obtemIdoso(id) async {
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

//todo: check
criaIdoso(dadosIdoso) async {
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

deletaIdoso(id) async {
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





