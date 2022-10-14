import 'dart:convert';
import 'package:flutter/material.dart';
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
  String? codigo;
  String? senha;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = <String, dynamic>{};
    user["id"] = id;
    user["name"] = name;
    user["email"] = email;
    user["tel"] = tel;
    user["imagem"] = imagem;
    return user;
  }

  static String obtemJson(dado) {
    var txtIdosos = [];

    for (var item in dado.refIdosos) {
      txtIdosos.add({"type": "Relationship", "value": item});
    }
    /*if(dado?.id.isEmpty){
      dado.id = Orion.createUniqueId();
    }*/
    
    if(dado.id==null || dado.id==""){
      var idUnico = Orion.createUniqueId();
      dado.id = "urn:ngsi-ld:cuidador:$idUnico";
    }

    String codigo = dado.id.toString().substring(dado.id.toString().length-4);

    return json.encode({
      "id": dado.id,
      "type": "cuidador",
      "name": {"type": "string", "value": dado.name},
      "email": {"type": "string", "value": dado.email},
      "senha": {"type": "string", "value": dado.senha},
      "tel": {"type": "Text", "value": dado.tel ?? ""},
      "tel2": {"type": "Text", "value": dado.tel2 ?? ""},
      /*"refIdosos": txtIdosos,*/
      "codigo": {"type": "string", "value": codigo}
    });
  }

  static String obtemIdSession(json){
    //print(json[0]['id']);
    var objeto = jsonDecode(json);
    if(objeto is List){
      objeto = objeto[0];
    }
    //Cuidador r = objeto;
    //print(objeto);
    debugPrint(objeto['id']);
    return objeto['id'];
  }

  static Cuidador obtemCuidador(json) {
    var dados = jsonDecode(json);
    Cuidador r = Cuidador();
    //print("dados: $dados");
    if (dados is List){
      dados = dados[0];
    }
    r.id = dados['id'];
    r.name = dados['name']['value'];
    r.email = dados['email']['value'];
    r.senha = dados['senha']['value'];
    r.tel = dados['tel']['value'];
    r.codigo = dados['codigo']['value'];
    //r.tel2 = dados['qtdPilulas']['value'];
    //r.imagem = dados['imagem']['value'];
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