import 'package:car_connect/domain/dto/dto_locacao.dart';

abstract class IDAOLocacao {

  String salvarReserva(DtoLocacao dadosLocacao);

}
