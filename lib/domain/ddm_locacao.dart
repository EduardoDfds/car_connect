import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/core_private/cliente.dart';
import 'package:car_connect/domain/core_private/locacao.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/primaria/i_entrada_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_enviar_mensagem_locacao.dart';
import 'package:car_connect/infra/dao_locacao_sqflite.dart';
import 'package:car_connect/infra/enviar_mensagem_locacao.dart';

class DDMLocacao implements IEntradalocacao {
  late DtoLocacao dtoLocacao;
  Locacao locacao;
  IDAOLocacao dao = DaoLocacao();
  IEnviarMensagemLocacao enviarMensagemLocacao = EnviarMensagemLocacao();

  DDMLocacao({required this.dtoLocacao})
      : locacao = Locacao(
            dataFim: dtoLocacao.dataFim,
            dataInicio: dtoLocacao.dataInicio,
            carro: Carro(
                nome: dtoLocacao.dadosCarro.nome,
                placa: dtoLocacao.dadosCarro.placa),
            cliente: Cliente(
                nome: dtoLocacao.dadosCliente.nome,
                cnh: dtoLocacao.dadosCliente.cnh));

  @override
  Future<List<DtoLocacao>> buscarLocacoes() {
    return dao.listarLocacoes();
  }

  @override
  DateTime getDataFim() {
    // TODO: implement getDataFim
    throw UnimplementedError();
  }

  @override
  DateTime getDataInicio() {
    // TODO: implement getDataInicio
    throw UnimplementedError();
  }

  @override
  String getPlaca() {
    // TODO: implement getPlaca
    throw UnimplementedError();
  }

  Future<bool> salvarLocao() async {
    return locacao.realizarLocacao(
        dtoLocacao, dao, buscarLocacoes(), enviarMensagemLocacao);
  }
}
