import 'package:car_connect/domain/dto/dto_cliente.dart';

import 'package:car_connect/domain/porta/secundaria/i_dao_cliente.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:sqflite/sqflite.dart';

class DaoCliente implements IDAOCliente {
  @override
  Future<bool> salvarCliente(DtoCliente dtoCliente) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO cliente (nome, cnh) VALUES (?,?)';
    var linhasAfetadas =
        await db.rawInsert(sql, [dtoCliente.nome, dtoCliente.cnh]);
    return linhasAfetadas > 0;
  }

  @override
  Future<DtoCliente> consultarCliente(int id) async {
    late Database db;
    try {
      const sql = "SELECT * FROM cliente WHERE id=?";
      db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      DtoCliente cliente = DtoCliente(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          cnh: resultado['cnh'].toString());
      return cliente;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  Future<List<DtoCliente>> listarClientess() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM cliente';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      List<DtoCliente> cliente = resultados.map((resultado) {
        return DtoCliente(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            cnh: resultado['cnh'].toString());
      }).toList();

      return cliente;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}
