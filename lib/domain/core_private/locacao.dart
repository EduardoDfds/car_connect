import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/core_private/cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';

import '../porta/primaria/i_entrada_locacao.dart';

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

  void verificaSeEstaLocado(
      DtoLocacao dadosLocacao, List<DtoLocacao> dtoLocacao) {
    for (var locado in dtoLocacao) {
      if (dadosLocacao.dadosCarro.placa == locado.dadosCarro.placa &&
          dadosLocacao.dataInicio == locado.dataInicio &&
          dadosLocacao.dataFim == locado.dataFim)
        throw Exception('Carro locado para o periodo');
    }
  }

  void verificaSeClienteTemLocacao(
      DtoLocacao dadosLocacao, List<DtoLocacao> dtoLocacao) {
    for (var locacao in dtoLocacao) {
      if (locacao.dadosCliente.cnh == dadosLocacao.dadosCliente.cnh &&
          locacao.dataFim == dadosLocacao.dataFim)
        throw Exception('Cliente possui locacão em aberta');
    }
  }

  String realizarLocacao(
      DtoLocacao dadosLocacao, IDAOLocacao dao, List<DtoLocacao> dtoLocacao) {
    verificaSeClienteTemLocacao(dadosLocacao, dtoLocacao);
    verificaSeEstaLocado(dadosLocacao, dtoLocacao);
    var mensagem = dao.salvarReserva(dadosLocacao);
    return mensagem;
  }
}
