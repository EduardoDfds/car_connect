import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/core_private/cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';

import '../porta/secundaria/i_enviar_mensagem_locacao.dart';

class Locacao {
  dynamic id;
  late Carro carro;
  late Cliente cliente;
  late DateTime dataInicio;
  late DateTime dataFim;

  Locacao(
      {required this.carro,
      required this.cliente,
      required this.dataFim,
      required this.dataInicio});

  Future<bool> verificaSeEstaLocado(
      DtoLocacao dadosLocacao, Future<List<DtoLocacao>> dtoLocacao) async {
    var locacoes = await dtoLocacao;
    for (var locado in locacoes) {
      if (dadosLocacao.dadosCarro.id == locado.dadosCarro.id &&
          dadosLocacao.dataInicio == locado.dataInicio &&
          dadosLocacao.dataFim == locado.dataFim) return false;
    }

    return true;
  }

  Future<bool> verificaSeClienteTemLocacao(
      DtoLocacao dadosLocacao, Future<List<DtoLocacao>> dtoLocacao) async {
    var locacoes = await dtoLocacao;
    for (var locacao in locacoes) {
      if (locacao.dadosCliente.id == dadosLocacao.dadosCliente.id &&
          locacao.dataFim == dadosLocacao.dataFim) return false;
    }

    return true;
  }

  verificaDataLocacao(DtoLocacao locao) {
    if (locao.dataFim.isBefore(dataInicio)) return false;
    if (locao.dataInicio.isBefore(DateTime.now())) return false;

    return true;
  }

  Future<bool> realizarLocacao(
      DtoLocacao dadosLocacao,
      IDAOLocacao dao,
      Future<List<DtoLocacao>> dtoLocacao,
      IEnviarMensagemLocacao iEnviarMensagemLocacao) async {
    var cliente = await verificaSeClienteTemLocacao(dadosLocacao, dtoLocacao);
    var carroL = await verificaSeEstaLocado(dadosLocacao, dtoLocacao);
    var data = verificaDataLocacao(dadosLocacao);
    if (carroL = true && cliente == true && data == true) {
      return dao.salvarReserva(dadosLocacao);
    }
    return false;
  }
}
