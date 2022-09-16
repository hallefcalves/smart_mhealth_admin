import 'dart:convert';

import '../web.dart';

class Cuidador {
  String? id;
  String? name;
  String? email;
  String? tel;
  String? tel2;
  List? refIdosos = [];
  List? refAgendas = [];
  String? imagem;
  int? codigo;
  String? senha;

  static String obtemJson(dado) {
    var txtIdosos = [];

    for (var item in dado.refIdosos){
      txtIdosos.add({"type": "Relationship", "value": item});
    }
    /*if(dado?.id.isEmpty){
      dado.id = Orion.createUniqueId();
    }*/
    dado.id = Orion.createUniqueId();
    //dado.id = "teste99999";
    return json.encode({
      "id": dado.id,
      "type": "cuidador",
      "name": {"type": "string", "value": dado.name},
      "email": {"type": "string", "value": dado.email},
      "senha": {"type": "string", "value": dado.senha},
      "tel": {"type": "Text", "value": dado.tel??""},
      "tel2": {"type": "Text", "value": dado.tel2??""},
      /*"refIdosos": txtIdosos,*/
      "codigo": {"type": "Integer", "value": "106283"}
    });
  }

  static Cuidador obtemRemedio(json) {
    var dados = jsonDecode(json);
    Cuidador r = Cuidador();
    r.id = dados.id;
    r.name = dados.name.value;
    r.email = dados.email.value;
    r.tel = dados.lote.value;
    r.tel2 = dados.qtdPilulas.value;
    r.imagem = dados.imagem.value;
    //for each idoso
    return r;
  }
}

/*{
  "id": "urn:ngsi-ld:cuidador:001",
  "type": "cuidador",
  "name": {
    "type": "string",
    "value": "Carol"
  },
  "email": {
    "type": "string",
    "value": "carol@gmail.com"
  },
  "senha": {
    "type": "string",
    "value": "12345678"
  },
  "tel": {
    "type": "string",
    "value": "(11) 94185-6164"
  },
  "tel2": {
    "type": "string",
    "value": "(11) 941856165"
  },
  "refIdosos": [
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:idoso:001"
    },
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:idoso:002"
    }
  ],
  "refAgendas": [
    {
      "type": "Relationship",
      "value": "urn:ngsi-ld:agenda:001"
    }
  ],
  "imagem": {
      "type": "string",
      "value":
          "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
   },
  "codigo": {
    "type": "Integer",
    "value": "106283"
  }
}*/