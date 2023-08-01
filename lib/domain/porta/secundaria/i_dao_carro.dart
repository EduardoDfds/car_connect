import 'package:car_connect/domain/dto/dto_carro.dart';

abstract class IDAOCarro {
  Future<bool> salvarCarro(DtoCarro dtoCarro);
  Future<DtoCarro> consultarCarro(int id);
  Future<List<DtoCarro>> listarCarros();
}
