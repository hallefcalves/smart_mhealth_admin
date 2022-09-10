import 'dart:convert';
import 'package:http/http.dart' as http;

class Orion {
  static var url = "20.163.17.242";

  Future<String?> fetchData(codigo) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://$url:1026/v2/entities/urn:ngsi-ld:Shelf:unit001/?options=values&attrs=refStore'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      response.stream.bytesToString().then((String value) => print(value));
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<String?> obtemVersao() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'http://$url:4041/iot/about'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      response.stream.bytesToString().then((String value) => print(value));
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  sendData() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://$url:1026/v2/op/update'));
    request.body = json.encode({
      "id": "urn:ngsi-ld:remedio:001",
      "type": "remedio",
      "name": {"type": "string", "value": "Advil"},
      "imagem": {
        "type": "string",
        "value":
            "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
      },
      "lote": {"type": "Text", "value": "AR750"},
      "qtdPilulas": {"type": "Integer", "value": 8},
      "dataValidade": {"type": "date", "value": "22/07/2029"},
      "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  criaIdoso() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('http://$url:1026/v2/op/update'));
    request.body = json.encode({
      "id": "urn:ngsi-ld:remedio:001",
      "type": "remedio",
      "name": {"type": "string", "value": "Advil"},
      "imagem": {
        "type": "string",
        "value":
        "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
      },
      "lote": {"type": "Text", "value": "AR750"},
      "qtdPilulas": {"type": "Integer", "value": 8},
      "dataValidade": {"type": "date", "value": "22/07/2029"},
      "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }


}



/* todos> dataCriacao:data
?todos> ultimaAtualizacao:data

remedios: {
    id: string,
    nome: "",
    img: "",
    lote: "",
    qtdPilulas: int,
    dataValidade: date,
    codigo: ref,
}

{
    "id": "urn:ngsi-ld:remedio:001",
    "type": "remedio",
    "name": {"type": "string", "value": "Advil"},
    "imagem": {
      "type": "string",
      "value":
          "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
    },
    "lote": {"type": "Text", "value": "AR750"},
    "qtdPilulas": {"type": "Integer", "value": 8},
    "dataValidade": {"type": "date", "value": "22/07/2029"},
    "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
  }

alarme: {
    id: string,
    horario_inicio: time,
    frequencia: ref,
    remedio:ref,
    codigo: ref,
}

{
    "id": "urn:ngsi-ld:alarme:001",
    "type": "alarme",
    "name":{
      "type": "Text"
      "value": "8 em 8"
    }
    "horario_inicio": {
      "type":"DateTime"
      "value":"2022-09-06T22:32:38.076Z"
    "remedio": {"type":"Relationship", "value":"urn:ngsi-ld:remedio:001"}
    "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
}

ingestaoRemedios {
    id: string,
    remedio: ref,
    dataHora: timestamp,
    tentativasAtraso: int,
    tomou: bool,
    codigo: ref,
}

{
  "id": "urn:ngsi-ld:ingestaoRemedio-idoso001:001",
  "type": "ingestaoRemedio"
  "remedio": {
    "type": "Relationship",
    "value": "urn:ngsi-ld:remedio:001"
  },
  "dataHora": {
    "type": "Date"
    "value":"2022-09-06T22:32:38.076Z",
  },
  "tenativasAtraso": {
    "type": Integer
    "value": 0,
  },
  "tomou": {
    "type": "Bool"
    "value": "false",
  },
  "refIdoso": {
    "type": "Relationship",
    "value": "urn:ngsi-ld:idoso:001"
  }
}

idoso {
  id: string,
  type: idoso
  refRemedio: [],
  refAlarme: [],
  refIngestaoRemedios: [],
  codigo: int,
}

{
  "id": "urn:ngsi-ld:idoso:001",
  "type": "Idoso",
  "refRemedio": [
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:remedio:001"
    },
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:remedio:001"
    }
  ],
  "refAlarme": [
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:alarme:001"
    }
  ],
  "refIngestaoRemedio": [
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:urn:ngsi-ld:ingestaoRemedio-idoso001:001"
    }
  ],
  "codigo": {
    "type": "Integer",
    "value": "106283"
  }
}

http://{{url}}:1026/v2/entities/?q=name==Advil&type=remedio

 */