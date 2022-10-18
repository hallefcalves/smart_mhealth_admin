import 'package:http/http.dart' as http;
import 'package:smart_mhealth_admin/http/ingestao_remedio/ingestao_remedio.dart';
import 'package:smart_mhealth_admin/http/remedio/remedio.dart';
import '../web.dart';

criaRemedioIngestaoComBase(Remedio dadosRemedioBase, idIdoso, idRemedioNovo) async {
  RemedioIngestao novoRem = RemedioIngestao();
  novoRem.id = idRemedioNovo;
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

Future<String?> obtemListaRemediosIngestao(idIdoso) async {
  return Orion.obtemDadosQuery('?type=remedio&q=refIdoso==$idIdoso');
}

Future<String?> obtemRemedioIngestao(id) async {
  return Orion.obtemDados(id);
}

