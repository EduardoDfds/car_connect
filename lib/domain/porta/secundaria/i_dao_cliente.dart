import 'package:car_connect/domain/dto/dto_cliente.dart';

abstract class IDAOCliente {
  Future<bool> salvarCliente(DtoCliente dtoCliente);
  Future<DtoCliente> consultarCliente(int id);
  Future<List<DtoCliente>> listarClientess();
}
