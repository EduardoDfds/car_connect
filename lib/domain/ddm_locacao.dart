import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/core_private/cliente.dart';
import 'package:car_connect/domain/core_private/locacao.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/primaria/i_entrada_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';
import 'package:car_connect/infra/dao_locacao.dart';

import '../infra/banco_fake.dart';

class DDMLocacao implements IEntradalocacao {
  late DtoLocacao dtoLocacao;
  Locacao locacao;
  IDAOLocacao dao = DaoLocacao();

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
  List<DtoLocacao> buscarLocacoes() {
    
    return BancoFake().buscaLocao();
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

  String salvarLocao(){
    return locacao.realizarLocacao(dtoLocacao, dao, buscarLocacoes());
  }
}
