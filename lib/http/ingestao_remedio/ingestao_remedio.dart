import 'dart:convert';

import '../web.dart';

class RemedioIngestao {
  String? id;
  String? name;
  String? imagem;
  String? lote;
  String? qtdPilulas;
  String? dataValidade;
  String? refIdoso;
  String? refRemedioCuidador;

  static String obtemJson(dado){
    
    if(dado.id==null || dado.id==""){
      dado.id = "urn:ngsi-ld:remedio:${Orion.createUniqueId()}";
    }
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
      "qtdPilulas": {"type": "string", "value": dado.qtdPilulas},
      "dataValidade": {"type": "date", "value": dado.dataValidade},
      "refIdoso": {"type": "Relationship", "value": dado.refIdoso},
      "refRemedioCuidador": {"type": "Relationship", "value": dado.refRemedioCuidador}
    });
  }

  static RemedioIngestao obtemRemedio(json){
    var dados = jsonDecode(json);
    RemedioIngestao r = RemedioIngestao();
    r.id = dados['id'];
    r.name = dados['name']['value'];
    r.imagem = dados['imagem']['value'];
    r.lote = dados['lote']['value'];
    r.qtdPilulas = dados['qtdPilulas']['value'].toString();
    r.dataValidade = dados['dataValidade']['value'];
    r.refIdoso = dados['refIdoso']['value'];
    r.refRemedioCuidador = dados['refRemedioCuidador']['value'];
    return r;
  }

}

/* {
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
} */