import 'dart:convert';

class Idoso {
  String? id;
  String? name;
  String? email;
  String? tel;
  String? tel2;
  List? refRemedio;
  List? refAlarme;
  List? refIngestaoRemedio;
  String? refCuidador;
  int? codigo;

  static String obtemJson(dado) {
    return json.encode({
      "id": dado.id,
      "type": "remedio",
      "name": {"type": "string", "value": dado.name},
      "email": {"type": "string", "value": dado.email},
      "tel": {"type": "Text", "value": dado.tel},
      "tel2": {"type": "Text", "value": dado.tel2},
      "refRemedio": [
        {"type": "Relationship", "value": dado.refRemedio},
        {"type": "Relationship", "value": "urn:ngsi-ld:remedio:001"}
      ],
      "refAlarme": [
        {"type": "Relationship", "value": "urn:ngsi-ld:alarme:001"}
      ],
      "refIngestaoRemedio": [
        {
          "type": "Relationship",
          "value": "urn:ngsi-ld:urn:ngsi-ld:ingestaoRemedio-idoso001:001"
        }
      ],
      "refCuidador": {"type": "Relationship", "value": "urn:ngsi:cuidador:001"},
      "codigo": {"type": "Integer", "value": "106283"}
    });
  }

  static Idoso obtemRemedio(json) {
    var dados = jsonDecode(json);
    Idoso r = Idoso();
    r.id = dados.id;
    r.name = dados.name.value;
    r.email = dados.email.value;
    r.tel = dados.lote.value;
    r.tel2 = dados.qtdPilulas.value;
    return r;
  }
}

/*{
  "id": "urn:ngsi-ld:idoso:001",
  "type": "Idoso",
  "name": {
    "type": "string",
    "value": "Severina"
  },
  "email": {
    "type": "string",
    "value": "severina@gmail.com"
  },
  "tel": {
    "type": "string",
    "value": "(11) 94185-6164"
  },
  "tel2": {
    "type": "string",
    "value": "(11) 941856165"
  },
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
  "refCuidador": {
    "type": "Relationship",
    "value": "urn:ngsi:cuidador:001"
  },
  "codigo": {
    "type": "Integer",
    "value": "106283"
  }
}*/