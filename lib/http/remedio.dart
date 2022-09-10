

import 'dart:convert';

class Remedio {
  String? id;
  String? name;
  String? imagem;
  String? lote;
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

  static Remedio obtemRemedio(json){
    var dados = jsonDecode(json);
    Remedio r = Remedio();
    r.id = dados.id;
    r.name = dados.name.value;
    r.imagem = dados.imagem.value;
    r.lote = dados.lote.value;
    r.qtdPilulas = dados.qtdPilulas.value;
    r.dataValidade = dados.dataValidade.value;
    r.refIdoso = dados.refIdoso.value;
    return r;
  }

}

/*{
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
  }*/