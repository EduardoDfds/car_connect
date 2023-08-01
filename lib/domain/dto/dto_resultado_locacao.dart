import 'dto_locacao.dart';

class DtoResultadoLocacao {
  DtoLocacao dtoLocacao;
  late String carro;
  late DateTime dataLocacao;
  late String nomeCliente;
  DtoResultadoLocacao({required this.dtoLocacao})
      : nomeCliente = dtoLocacao.dadosCliente.nome,
        carro = dtoLocacao.dadosCarro.nome,
        dataLocacao = dtoLocacao.dataInicio;
}
