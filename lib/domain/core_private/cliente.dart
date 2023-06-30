import 'package:car_connect/domain/dto/dto_cliente.dart';

class Cliente {
  late String nome;
  late String cnh;

  Cliente({required this.nome, required this.cnh});
  bool clientePossuiuCnh(DtoCliente dtoCliente) {
    if (dtoCliente.cnh.isNotEmpty && dtoCliente.cnh != null) return true;

    return false;
  }
}
