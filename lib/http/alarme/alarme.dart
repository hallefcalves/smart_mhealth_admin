import 'dart:convert';

class Alarme {
  String? id;
  String? name;
  DateTime? horarioInicio;
  String? remedio;
  int? qtdPilulas;
  String? dataValidade;
  String? refIdoso;


  static String obtemJson(dado){
    return json.encode({
      "id": dado.id,
      "type": "remedio",
      "name": {"type": "string", "value": dado.name},
      "imagem": {
        "type": "string",
        "value":
        dado.imagem
      },
      "lote": {"type": "Text", "value": dado.lote},
      "qtdPilulas": {"type": "Integer", "value": dado.qtdPilulas},
      "dataValidade": {"type": "date", "value": dado.dataValidade},
      "refIdoso": {"type": "Relationship", "value": dado.refIdoso}
    });
  }

  static Alarme obtemRemedio(json){
    var dados = jsonDecode(json);
    Alarme r = Alarme();
    r.id = dados['id'];
    r.name = dados['name']['value'];
    r.horarioInicio = dados['imagem']['value'];
    r.remedio = dados['lote']['value'];
    r.qtdPilulas = dados['qtdPilulas']['value'];
    r.dataValidade = dados['dataValidade']['value'];
    r.refIdoso = dados['refIdoso']['value'];
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