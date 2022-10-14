import 'dart:convert';

import 'package:smart_mhealth_admin/http/external_api.dart';

import '../web.dart';

class Remedio {
  String? id;
  String? name;
  String? imagem;
  String? lote;
  String? qtdPilulas;
  String? dataValidade;
  String? mensagem;
  String? refCuidador;
  String? bula;

  static String obtemJson(dado) {
    if (dado.id == null || dado.id == "") {
      dado.id = "urn:ngsi-ld:remedio:${Orion.createUniqueId()}";
    }

    
    print(dado.bula);

    return json.encode({
      "id": dado.id,
      "type": "remedio",
      "name": {"type": "string", "value": dado.name},
      "imagem": {"type": "string", "value": dado.imagem},
      "lote": {"type": "Text", "value": dado.lote},
      "qtdPilulas": {"type": "Text", "value": dado.qtdPilulas},
      "dataValidade": {"type": "date", "value": dado.dataValidade},
      "mensagem": {"type": "Relationship", "value": dado.mensagem},
      "refCuidador": {"type": "Relationship", "value": dado.refCuidador},
      "linkBula": {"type": "String", "value": dado.bula}
    });
  }

  static Remedio obtemRemedio(json) {
    var dados = jsonDecode(json);
    Remedio r = Remedio();
    r.id = dados['id'];
    r.name = dados['name']['value'];
    r.imagem = dados['imagem']['value'];
    r.lote = dados['lote']['value'];
    r.qtdPilulas = dados['qtdPilulas']['value'];
    r.dataValidade = dados['dataValidade']['value'];
    r.mensagem = dados['mensagem']['value'];
    r.refCuidador = dados['refCuidador']['value'];
    r.bula = dados['linkBula']['value'];
    return r;
  }

  static List<Remedio> obtemRemedios(json) {
    var dados = jsonDecode(json);
    List<Remedio> remedios = [];

    for (final dado in dados) {
      Remedio r = Remedio();
      //print(dado);
      //print(dado['name']);
      r.id = dado['id'];
      r.name = dado['name']['value'];
      r.imagem = dado['imagem']['value'];
      r.lote = dado['lote']['value'];
      r.qtdPilulas = dado['qtdPilulas']['value'].toString();
      r.dataValidade = dado['dataValidade']['value'];
      r.mensagem = dado['mensagem']['value'];
      r.refCuidador = dado['refCuidador']['value'];
      remedios.add(r);
    }
    return remedios;
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