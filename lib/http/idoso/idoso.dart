import 'dart:convert';

import '../web.dart';

class Idoso {
  String? id;
  String? name;
  String? email;
  String? tel;
  String? tel2;
  List? refRemedio = [];
  List? refAlarme = [];
  List? refIngestaoRemedio = [];
  String? refCuidador;
  String? codigo;

  static String obtemJson(dado) {

    if(dado.id==null || dado.id==""){
      dado.id = "urn:ngsi-ld:idoso:${Orion.createUniqueId()}";
    }

    if(dado.codigo==null || dado.codigo==""){
      dado.codigo = getCodigoIdoso(dado.refCuidador);
    }

    var txtRemedios = [];
    for (var item in dado.refRemedio) {
      txtRemedios.add({"type": "Relationship", "value": item});
    }

    var txtAlarme = [];
    for (var item in dado.refAlarme) {
      txtAlarme.add({"type": "Relationship", "value": item});
    }

    var txtIngestaoRemedio = [];
    for (var item in dado.refIngestaoRemedio) {
      txtIngestaoRemedio.add({"type": "Relationship", "value": item});
    }

    return json.encode({
      "id": dado.id,
      "type": "idoso",
      "name": {"type": "string", "value": dado.name},
      "email": {"type": "string", "value": dado.email},
      "tel": {"type": "Text", "value": dado.tel??""},
      "tel2": {"type": "Text", "value": dado.tel2??""},
      "refRemedio": {
        "type": "Relationships", "value": txtRemedios
      },
      "refAlarme": {
        "type": "Relationships", "value": txtAlarme
      },
      "refIngestaoRemedio": {
        "type": "Relationships", "value": txtIngestaoRemedio
      },
      "refCuidador": {"type": "Relationship", "value": dado.refCuidador},
      "codigo": {"type": "Integer", "value": dado.codigo}
    });
  }

  static getCodigoIdoso(idBase){
    return "someValue";//change
  }

  static Idoso obtemIdoso(json) {
    var dados = jsonDecode(json);
    Idoso r = Idoso();
    r.id = dados['id'];
    r.name = dados['name']['value'];
    r.email = dados['email']['value'];
    r.tel = dados['lote']['value'];
    r.tel2 = dados['qtdPilulas']['value'];
    return r;
  }

  static List<Idoso> obtemIdosos(json) {
    var dados = jsonDecode(json);
    List<Idoso> idosos = [];
    
    for(final dado in dados){
      Idoso r = Idoso();
      r.id = dado['id'];
      r.name = dado['name']['value'];
      r.email = dado['email']['value'];
      r.tel = dado['tel']['value'];
      r.tel2 = dado['tel2']['value'];
      idosos.add(r);
    }
    return idosos;
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
}

return json.encode({
      "id": dado.id,
      "type": "idoso",
      "name": {"type": "string", "value": dado.name},
      "email": {"type": "string", "value": dado.email},
      "tel": {"type": "Text", "value": dado.tel},
      "tel2": {"type": "Text", "value": dado.tel2},
      "refRemedio": {
        "type": "Relationships", "value":[
        {"type": "Relationship", "value": dado.refRemedio},
        {"type": "Relationship", "value": "urn:ngsi-ld:remedio:001"}]
      },
      "refAlarme": {
        "type": "Relationships", "value":[
        {"type": "Relationship", "value": "urn:ngsi-ld:alarme:001"}]
      },
      "refIngestaoRemedio": {
        "type": "Relationships", "value":[
        {
          "type": "Relationship",
          "value": "urn:ngsi-ld:urn:ngsi-ld:ingestaoRemedio-idoso001:001"
        }]
      },
      "refCuidador": {"type": "Relationship", "value": "urn:ngsi:cuidador:001"},
      "codigo": {"type": "Integer", "value": "106283"}
    });

*/