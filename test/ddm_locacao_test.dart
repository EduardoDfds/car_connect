import 'package:car_connect/domain/ddm_locacao.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DtoLocacao dtoLocacao;
  late DtoCarro dtoCarro;
  late DtoCliente dtoCliente;
  late DDMLocacao locacao;

   test('Carro locado', () {
    dtoCarro = DtoCarro(nome: 'Onix', placa: 'BBZ1457');
    dtoCliente = DtoCliente(nome: 'João', cnh: '49798881670');
    dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));
    locacao = DDMLocacao(dtoLocacao: dtoLocacao);
    String mensagem = locacao.salvarLocao();
    expect(mensagem, 'carro locado');
  });
  
  test('Já existe locação para o carro e o cliente', () {
    dtoCarro = DtoCarro(nome: 'Supra', placa: 'JAP8631');
    dtoCliente = DtoCliente(nome: 'Gabriel', cnh: '63651821741');
    dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));
    locacao = DDMLocacao(dtoLocacao: dtoLocacao);
    expect(() => locacao.salvarLocao(), throwsException);
  });

  test('Ja existe locação para o cliente', () {
    dtoCarro = DtoCarro(nome: 'Jetta', placa: 'AJF5997');
    dtoCliente = DtoCliente(nome: 'Kaio', cnh: '07572043952');
    dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));
    locacao = DDMLocacao(dtoLocacao: dtoLocacao);
    expect(() => locacao.salvarLocao(), throwsException);
  });

  test('Ja existe locação para o carro', () {
    dtoCarro = DtoCarro(nome: 'Gol', placa: 'AXZE952');
    dtoCliente = DtoCliente(nome: 'Junior', cnh: '16419697580');
    dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));
    locacao = DDMLocacao(dtoLocacao: dtoLocacao);
    expect(() => locacao.salvarLocao(), throwsException);
  });

}
