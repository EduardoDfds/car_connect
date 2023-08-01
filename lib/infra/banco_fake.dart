import '../domain/dto/dto_carro.dart';
import '../domain/dto/dto_cliente.dart';
import '../domain/dto/dto_locacao.dart';

class BancoFake {
  List<DtoLocacao> buscaLocao() {
    List<DtoLocacao> dadosfake = [];

    DtoCarro dtoCarro = DtoCarro(nome: 'Gol', placa: 'AXZE952');
    DtoCliente dtoCliente = DtoCliente(nome: 'Joao', cnh: '35545385872');
    DtoLocacao dtoLocacao = DtoLocacao(
        dadosCarro: dtoCarro,
        dadosCliente: dtoCliente,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));

    DtoCarro dtoCarro1 = DtoCarro(nome: 'S10', placa: 'BBA458');
    DtoCliente dtoCliente1 = DtoCliente(nome: 'Kaio', cnh: '07572043952');
    DtoLocacao dtoLocacao1 = DtoLocacao(
        dadosCarro: dtoCarro1,
        dadosCliente: dtoCliente1,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));

    DtoCarro dtoCarro2 = DtoCarro(nome: 'Supra', placa: 'JAP88631');
    DtoCliente dtoCliente2 = DtoCliente(nome: 'Gabriel', cnh: '63651821741');
    DtoLocacao dtoLocacao2 = DtoLocacao(
        dadosCarro: dtoCarro2,
        dadosCliente: dtoCliente2,
        dataFim: DateTime.utc(2023, DateTime.february, 01),
        dataInicio: DateTime.utc(2023, DateTime.february, 01));

    dadosfake.add(dtoLocacao);
    dadosfake.add(dtoLocacao1);
    dadosfake.add(dtoLocacao2);

    return dadosfake;
  }

  List<DtoCarro> buscarCarros() {
    DtoCarro golf = DtoCarro(nome: 'Golf', placa: 'JJT7489');
    golf.id = 1;
    DtoCarro jetta = DtoCarro(nome: 'Jetta', placa: 'APN1234');
    jetta.id = 2;

    List<DtoCarro> carros = [];
    carros.add(jetta);
    carros.add(golf);
    return carros;
  }

  List<DtoCliente> bucarClientes() {
    DtoCliente duda = DtoCliente(nome: 'Duda', cnh: '12345678');
    duda.id = 1;
    DtoCliente gabriel = DtoCliente(nome: 'Gabriel', cnh: '63651821741');
    gabriel.id = 2;
    List<DtoCliente> clientes = [];
    clientes.add(duda);
    clientes.add(gabriel);
    return clientes;
  }
}
