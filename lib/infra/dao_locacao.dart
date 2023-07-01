import 'dart:ffi';

import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';

class DaoLocacao implements IDAOLocacao {
  @override
  bool salvarReserva(DtoLocacao dadosLocacao) {
    return true;
  }
}
