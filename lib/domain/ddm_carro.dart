import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/porta/primaria/i_entrada_carro.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_carro.dart';
import 'package:car_connect/infra/dao_carro_sqflite.dart';

class DDMCarro implements IEntradaCarro {
  late DtoCarro dtoCarro;
  Carro carro;
  IDAOCarro dao = DaoCarro();

  DDMCarro({required this.dtoCarro})
      : carro = Carro(nome: dtoCarro.nome, placa: dtoCarro.placa);

  @override
  int buscaQuantidadePlaca(String placa) {
    return 0;
  }

  String salvarCarro() {
    carro.carroContemPlaca(dtoCarro);
    carro.carroPlacaUnica(buscaQuantidadePlaca(dtoCarro.placa));
    var resultadoBanco = carro.salvarcarro(dtoCarro, dao);
    if (resultadoBanco == false) return 'Carro não cadastrado';
    return 'Carro cadastrado com sucesso!';
  }
}
