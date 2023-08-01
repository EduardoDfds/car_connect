import 'package:car_connect/domain/ddm_locacao.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late DtoLocacao dtoLocacao;
  late DtoCarro dtoCarro;
  late DtoCliente dtoCliente;
  late DDMLocacao locacao;

  setUp(() async {
    sqfliteFfiInit();
    databaseFactory =
        databaseFactoryFfi; // permite fazer os testes sem precisar do android
    String caminho = join(await getDatabasesPath(), 'banco.db');
    db = await Conexao.abrirConexao();
  });

  tearDownAll(() {
    db.close();
  });

  test('Carro locado', () async {
    dtoCarro = DtoCarro(nome: 'Onix', placa: 'BBZ1457');
    dtoCarro.id = 1;
    dtoCliente = DtoCliente(nome: 'João', cnh: '49798881670');
    dtoCliente.id = 1;
    dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));
    locacao = DDMLocacao(dtoLocacao: dtoLocacao);
    var mensagem = await locacao.salvarLocao();
    expect(mensagem, true);
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
