import 'dart:convert';

class Alarme {
  String? id;
  String? refRemedio;
  String? refIdoso;
  String? refAgenda;
  int? tentativas;
  DateTime? ultimoConsumo;


  static String obtemJson(dado){
    return json.encode({
      "id": dado.id,
      "type": "alarme",
      "refRemedio": {"type": "Relationship", "value": dado.refRemedio},
      "refIdoso": {
        "type": "Relationship",
        "value": dado.refIdoso
      },
      "refAgenda": {"type": "Relationship", "value": dado.refAgenda},
      "tentativas": {"type": "Integer", "value": dado.tentativas},
      "ultimoConsumo": {"type": "date", "value": dado.ultimoConsumo}
    });
  }

  static Alarme obtemAlarme(json){
    var dados = jsonDecode(json);
    Alarme r = Alarme();    
    if (dados is List){
      dados = dados[0];
    }
    r.id = dados['id'];
    r.refRemedio = dados['refRemedio']['value'];
    r.refIdoso = dados['refIdoso']['value'];
    r.refAgenda = dados['refAgenda']['value'];
    r.tentativas = dados['tentativas']['value'];
    r.ultimoConsumo = dados['ultimoConsumo']['value'];
    return r;
  }

}

/* {
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
} */