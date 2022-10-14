import 'package:flutter/cupertino.dart';
import 'package:g_json/g_json.dart';
import 'package:http/http.dart' as http;

Future<String> verRemedioAPI(gtin) async {
  var headers = {
    'Content-Type': 'application/json',
    'X-Cosmos-Token': 'lnAeQBm591Vh2Fgw5ndlMA',
    'User-Agent': 'Cosmos-API-Request',
  };

  var url = Uri.parse('https://api.cosmos.bluesoft.com.br/gtins/$gtin.json');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }
  return (res.body);
}

Future<String> procurarBula(name) async {
  var urlRemedio =
      Uri.parse("https://bula.vercel.app/pesquisar?nome=$name&pagina=1");
  var res = await http.get(urlRemedio);
  if (res.statusCode != 200) {
    throw Exception('http.get error: statusCode= ${res.statusCode}');
  }
  var decode = JSON.parse(res.body);
  var id = decode["content"][0]["idBulaProfissionalProtegido"];
  print(id);
  var urlBula =
      "https://consultas.anvisa.gov.br/api/consulta/medicamentos/arquivo/bula/parecer/$id/?Authorization=";
  print(urlBula);
  return urlBula;
  // debugPrint(id.toString());
  // var res2 = await http.get(Uri.https("https://bula.vercel.app/bula?id=$id"));
  // debugPrint(res2.toString());
  // var decode2 = JSON.parse(res2.body);
  // print(decode2);
  // return decode2["pdf"].toString();
}

class TextUp extends StatefulWidget {
  const TextUp({Key? key}) : super(key: key);

  @override
  State<TextUp> createState() => _TextUpState();
}

class _TextUpState extends State<TextUp> {
  @override
  Widget build(BuildContext context) {
    return const Text('10');
  }
}
