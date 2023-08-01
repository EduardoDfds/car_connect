import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_locacao.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:car_connect/infra/dao_carro_sqflite.dart';
import 'package:car_connect/infra/dao_cliente_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

import '../domain/porta/secundaria/i_dao_carro.dart';
import '../domain/porta/secundaria/i_dao_cliente.dart';

class DaoLocacao implements IDAOLocacao {
  DtoCarro dtoCarro = DtoCarro(nome: '', placa: '');
  DtoCliente dtoCliente = DtoCliente(nome: '', cnh: '');
  IDAOCarro daoCarro = DaoCarro();
  IDAOCliente daoCliente = DaoCliente();
  List<DtoLocacao> locacoes = [];
  @override
  Future<bool> salvarReserva(DtoLocacao dadosLocacao) async {
    Database db = await Conexao.abrirConexao();
    const sql =
        'INSERT INTO locacao (dataInicio, dataFim, carro_id, cliente_id) VALUES (?,?,?,?)';
    var linhasAfetadas = await db.rawInsert(sql, [
      dadosLocacao.dataInicio.toString(),
      dadosLocacao.dataFim.toString(),
      dadosLocacao.dadosCarro.id,
      dadosLocacao.dadosCliente.id
    ]);
    return linhasAfetadas > 0;
  }

  DtoCarro consultaCarro(int id) {
    DaoCarro().consultarCarro(id).then((value) {
      dtoCarro = DtoCarro(id: value.id, nome: value.nome, placa: value.placa);
    });
    return dtoCarro;
  }

  DtoCliente ConsultaCliente(id) {
    Future<DtoCliente> clienteFuture = DaoCliente().consultarCliente(id);

    clienteFuture.then((value) {
      dtoCliente = value;
    });
    return dtoCliente;
  }

  @override
  Future<List<DtoLocacao>> listarLocacoes() async {
    late Database db;

    try {
      const sql = 'SELECT * FROM locacao';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));

      for (var resultado in resultados) {
        locacoes.add(DtoLocacao(
          dadosCarro:
              await daoCarro.consultarCarro(resultado['carro_id'] as int),
          dadosCliente:
              await daoCliente.consultarCliente(resultado['cliente_id'] as int),
          dataInicio: DateFormat('yyyy-MM-dd')
              .parse(resultado['dataInicio'].toString()),
          dataFim:
              DateFormat('yyyy-MM-dd').parse(resultado['dataFim'].toString()),
        ));
      }
      return locacoes;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}
