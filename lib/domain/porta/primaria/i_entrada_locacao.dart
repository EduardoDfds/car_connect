import 'package:car_connect/domain/dto/dto_locacao.dart';

abstract class IEntradalocacao {
  String getPlaca();
  DateTime getDataInicio();
  DateTime getDataFim();
  Future<List<DtoLocacao>> buscarLocacoes();
}
