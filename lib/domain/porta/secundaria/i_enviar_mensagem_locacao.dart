
import 'package:car_connect/domain/dto/dto_resultado_locacao.dart';

abstract class IEnviarMensagemLocacao {
  String enviarMensagem(DtoResultadoLocacao dtoResultadoLocacao);
}
