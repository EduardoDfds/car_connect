import 'package:car_connect/domain/core_private/carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/domain/porta/primaria/i_entrada_carro.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_cliente.dart';
import 'package:car_connect/infra/dao_cliente_sqflite.dart';

import 'core_private/cliente.dart';

class DDMCliente implements IEntradaCarro {
  late DtoCliente dtoCliente;
  Cliente cliente;
  IDAOCliente dao = DaoCliente();

  DDMCliente({required this.dtoCliente})
      : cliente = Cliente(nome: dtoCliente.nome!, cnh: dtoCliente.cnh!);

  @override
  int buscaQuantidadePlaca(String placa) {
    return 0;
  }

  String salvarCliente() {
    cliente.salvarCliente(dtoCliente, dao);
    return 'Cliente cadastrado com sucesso!';
  }
}
