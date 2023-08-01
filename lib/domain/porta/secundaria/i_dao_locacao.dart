import 'package:car_connect/domain/dto/dto_locacao.dart';

import '../../core_private/carro.dart';
import '../../core_private/cliente.dart';
import '../../core_private/locacao.dart';

abstract class IDAOLocacao {
  Future<bool> salvarReserva(DtoLocacao dadosLocacao);

  Future<List<DtoLocacao>> listarLocacoes();
}
