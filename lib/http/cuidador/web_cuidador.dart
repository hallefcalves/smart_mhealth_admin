import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/cuidador/cuidador.dart';
import 'package:smart_mhealth_admin/http/web.dart';
import 'package:smart_mhealth_admin/util/sessao.dart';

Future<String?> obtemCuidador(id) async {
  var request = http.Request(
      'GET', Uri.parse('http://${Orion.url}:1026/v2/entities/$id'));
  //request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    debugPrint(response.reasonPhrase);
  }
  return null;
}

Future<String?> obtemCuidadorPorEmail(email) async {
  var headers = {
    'Accept': 'application/json',
    'fiware-service': 'helixiot',
    'fiware-servicepath': '/'
  };
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/?type=cuidador&q=email==$email'));
  //request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    debugPrint(response.reasonPhrase);
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
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}

criaCuidador(dadosCuidador) async {
  var headers = {
    'Content-Type': 'application/json',
    'fiware-service': 'helixiot',
    'fiware-servicepath': '/'
  };
  var urll = 'http://${Orion.url}:1026/v2/entities';
  debugPrint(urll);
  var request = http.Request('POST', Uri.parse(urll));
  String jsonCuidador = Cuidador.obtemJson(dadosCuidador);
  request.body = jsonCuidador;
  request.headers.addAll(headers);
  debugPrint(request.body);
  http.StreamedResponse response = await request.send();

  await Sessao.salvarUser(jsonCuidador);

  if (response.statusCode == 200) {
    response.stream
        .bytesToString()
        .then((String value) => debugPrint("Status 200:$value"));
  } else {
    debugPrint("Status ${response.statusCode}:${response.reasonPhrase}");
  }
}

deletaCuidador(id) async {
  var headers = {
    'Content-Type': 'application/json',
    'fiware-service': 'helixiot',
    'fiware-servicepath': '/'
  };
  var request = http.Request(
      'DELETE',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/?q=id==$id&type=remedio'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}
