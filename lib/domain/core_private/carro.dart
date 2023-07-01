import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_carro.dart';

class Carro {
  dynamic id;
  late String nome;
  late String placa;

  Carro({required this.nome, required this.placa});

  void carroContemPlaca(DtoCarro dtoCarro) {
    if (dtoCarro.placa.isEmpty && dtoCarro.placa != null)
      throw Exception('Forneça uma placa');
  }

  void carroPlacaUnica(int qtdPlaca) {
    if (qtdPlaca > 0) throw Exception('Ja existe carro com essa placa');
  }

  String salvarcarro(DtoCarro dtoCarro, IDAOCarro dao) {
    carroContemPlaca(dtoCarro);
    dao.salvarCarro(dtoCarro);
    return 'mensagem';
  }
}
