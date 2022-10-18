import 'dart:convert';

import '../web.dart';

class Alarme {
  String? id;
  String? refRemedio;
  String? refIdoso;
  String? refAgenda;
  int? tentativas;
  DateTime? ultimoConsumo = DateTime(0);//temp


  static String obtemJson(dado){

    if(dado.id==null || dado.id==""){
      var idUnico = Orion.createUniqueId();
      dado.id = "urn:ngsi-ld:alarme:$idUnico";
    }

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
      "ultimoConsumo": {"type": "date", "value": dado.ultimoConsumo.toString()}
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
    r.ultimoConsumo = DateTime.parse(dados['ultimoConsumo']['value']);
    return r;
  }

  static List<Alarme> obtemAlarmes(json) {
    var dados = jsonDecode(json);
    List<Alarme> alarmes = [];
    
    for(final dado in dados){
      Alarme r = Alarme();
      r.id = dado['id'];
      r.refRemedio = dado['refRemedio']['value'];
      r.refIdoso = dado['refIdoso']['value'];
      r.refAgenda = dado['refAgenda']['value'];
      r.tentativas = dado['tentativas']['value'];
      r.ultimoConsumo = DateTime.parse(dado['ultimoConsumo']['value']);
      alarmes.add(r);
    }
    return alarmes;
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