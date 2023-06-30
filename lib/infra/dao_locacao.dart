import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';

class DaoLocacao implements IDAOLocacao {
  @override
  String salvarReserva(DtoLocacao dadosLocacao) {
    return 'carro locado';
  }

}
