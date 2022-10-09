import 'dart:convert';
import '../web.dart';

class Agenda {
  String? id;
  String? horarioInicio;
  String? frequencia;
  int? repeticoesAdiar;
  int? minutosAdiar;
  String? refCuidador;

  //todo: ajustar datas
  static String obtemJson(dado){

    if(dado.id==null || dado.id==""){
      dado.id = "urn:ngsi-ld:agenda:${Orion.createUniqueId()}";
    }

    return json.encode({
      "id": dado.id,
      "type": "agenda",
      "horarioInicio": {"type": "string", "value": dado.horarioInicio},
      "frequencia": {"type": "Text", "value": dado.frequencia},
      "repeticoesAdiar": {"type": "Integer", "value": dado.repeticoesAdiar},
      "minutosAdiar": {"type": "date", "value": dado.minutosAdiar},
      "refCuidador": {"type": "Relationship", "value": dado.refCuidador}
    });
  }

  static Agenda obtemAgenda(json){
    var dados = jsonDecode(json);
    Agenda r = Agenda();
    r.id = dados['id'];
    r.frequencia = dados['frequencia']['value'];
    r.horarioInicio = dados['horarioInicio']['value'];
    r.repeticoesAdiar = dados['repeticoesAdiar']['value'];
    r.minutosAdiar = dados['minutosAdiar']['value'];
    r.refCuidador = dados['refCuidador']['value'];
    return r;
  }

  static List<Agenda> obtemAgendas(json) {
    var dados = jsonDecode(json);
    List<Agenda> remedios = [];
    
    for(final dado in dados){
      Agenda r = Agenda();
      //print(dado);
      //print(dado['name']);
       r.id = dado['id'];
      r.frequencia = dado['frequencia']['value'];
      r.horarioInicio = dado['horarioInicio']['value'];
      r.repeticoesAdiar = dado['repeticoesAdiar']['value'];
      r.minutosAdiar = dado['minutosAdiar']['value'];
      r.refCuidador = dado['refCuidador']['value'];
      remedios.add(r);
    }
    return remedios;
  }

}

/*agendas: {
    horarioInicio:hora,
    frequencia:hora,
    repeticoesAdiar:int,
    minutosAdiar:int
}*/