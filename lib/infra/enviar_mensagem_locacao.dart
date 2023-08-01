import 'package:car_connect/domain/dto/dto_resultado_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_enviar_mensagem_locacao.dart';

class EnviarMensagemLocacao implements IEnviarMensagemLocacao {
  @override
  String enviarMensagem(DtoResultadoLocacao dtoResultadoLocacao) {
    String mensagem;

    mensagem =
        '''Parábens ${dtoResultadoLocacao.nomeCliente}, sua locação foi realizada com sucesso! \nCarrro: ${dtoResultadoLocacao.carro} \nData locação: ${dtoResultadoLocacao.dataLocacao.toString()}''';
    return mensagem;
  }
}
