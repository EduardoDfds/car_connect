import 'dart:ffi';

import 'package:car_connect/domain/dto/dto_locacao.dart';

abstract class IDAOLocacao {

  bool salvarReserva(DtoLocacao dadosLocacao);

}
