import '../../dto/dto_locacao.dart';
import '../../dto/dto_resultado_locacao.dart';

abstract class IEnviarMensagemLocacao {
  String enviarMensagem(DtoResultadoLocacao dtoResultadoLocacao);
}
