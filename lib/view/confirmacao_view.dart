import 'package:car_connect/domain/ddm_gerar.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:flutter/material.dart';
import '../domain/ddm_enviar_email.dart';
import '../domain/dto/dto_enviarEmail.dart';
import '../domain/dto/dto_resultado_locacao.dart';

class ConfirmacaoView extends StatelessWidget {
  String mensagem;
  DtoLocacao locacao;
  String destinatario;
  ConfirmacaoView(
      {super.key,
      required this.mensagem,
      required this.locacao,
      required this.destinatario});

  @override
  Widget build(BuildContext context) {
    DDMEnviarEmail ddmEnviarEmail = DDMEnviarEmail(
      dtoEnviarEmail: DtoEnviarEmail(
          assunto: 'Confirmação de locação',
          body: mensagem,
          dtoResultadoLocacao: DtoResultadoLocacao(dtoLocacao: locacao),
          emailCliente: destinatario),
    );
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
                child: Row(
                  children: [
                    Text(
                      'Locação realziada com sucesso!',
                    ),
                    Icon(
                      Icons.verified,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 300,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    ddmEnviarEmail.enviarMenssagem();
                  },
                  child: const Text('Enviar Email'),
                ),
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    var pdf = GerarPdf(
                        dtoResultadoLocacao:
                            DtoResultadoLocacao(dtoLocacao: locacao),
                        context: context);

                    pdf.generatePDF();
                    pdf.viewPDF();
                  },
                  child: const Text('Gerar comprovante'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
