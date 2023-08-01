import 'package:car_connect/domain/dto/dto_enviarEmail.dart';
import 'package:car_connect/infra/enviar_mensagem_locacao.dart';
import 'package:url_launcher/url_launcher.dart';

class DDMEnviarEmail {
  DtoEnviarEmail dtoEnviarEmail;

  DDMEnviarEmail({required this.dtoEnviarEmail});

  EnviarMensagemLocacao enviarMensagemLocacao = EnviarMensagemLocacao();

  Future<bool> enviarMenssagem() async {
    String assunto = dtoEnviarEmail.assunto;
    String emailCliente = dtoEnviarEmail.emailCliente;

    return launchUrl(Uri(
        scheme: 'mailto',
        path: emailCliente,
        queryParameters: {'subject': assunto, 'body': dtoEnviarEmail.body}));
  }
}
