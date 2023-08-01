import 'package:car_connect/domain/dto/dto_resultado_locacao.dart';

class DtoEnviarEmail {
  DtoResultadoLocacao dtoResultadoLocacao;
  String assunto;
  String emailCliente;
  String body;

  DtoEnviarEmail(
      {required this.dtoResultadoLocacao,
      required this.assunto,
      required this.body,
      required this.emailCliente});
}
