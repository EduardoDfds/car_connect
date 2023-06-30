import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';

class DtoLocacao {
  dynamic id;
  late DateTime dataInicio;
  late DateTime dataFim;
  late DtoCarro dadosCarro;
  late DtoCliente dadosCliente;

  DtoLocacao({required this.dadosCarro, required this.dadosCliente, required this.dataFim, required this.dataInicio});
}
