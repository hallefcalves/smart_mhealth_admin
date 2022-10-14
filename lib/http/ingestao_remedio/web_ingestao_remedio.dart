import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/ingestao_remedio/ingestao_remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import '../web.dart';

criaRemedioIngestaoComBase(Remedio dadosRemedioBase, idIdoso) async {
  RemedioIngestao novoRem = RemedioIngestao();
  novoRem.id = "urn:ngsi-ld:remedio:${Orion.createUniqueId()}";
  novoRem.name = dadosRemedioBase.name;
  novoRem.imagem = dadosRemedioBase.imagem;
  novoRem.lote = dadosRemedioBase.lote;
  novoRem.qtdPilulas = dadosRemedioBase.qtdPilulas;
  novoRem.dataValidade = dadosRemedioBase.dataValidade;
  novoRem.refIdoso = idIdoso;
  novoRem.refRemedioCuidador = dadosRemedioBase.id;

  novoRem.dataValidade = dadosRemedioBase.dataValidade;

  return Orion.criaEntidade(RemedioIngestao.obtemJson(novoRem));
}
