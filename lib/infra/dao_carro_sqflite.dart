import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/porta/secundaria/i_dao_carro.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:sqflite/sqflite.dart';

class DaoCarro implements IDAOCarro {
  @override
  Future<bool> salvarCarro(DtoCarro dtoCarro) async {
    Database db = await Conexao.abrirConexao();
    const sql = 'INSERT INTO carro (nome, placa) VALUES (?,?)';
    var linhasAfetadas =
        await db.rawInsert(sql, [dtoCarro.nome, dtoCarro.placa]);
    return linhasAfetadas > 0;
  }

  @override
  Future<DtoCarro> consultarCarro(int id) async {
    print(id);
    try {
      const sql = "SELECT * FROM carro WHERE id=?";
      Database db = await Conexao.abrirConexao();
      Map<String, Object?> resultado = (await db.rawQuery(sql, [id])).first;
      print(resultado);
      print('object');
      if (resultado.isEmpty) throw Exception('Sem registros com este id');
      DtoCarro carro = DtoCarro(
          id: resultado['id'] as int,
          nome: resultado['nome'].toString(),
          placa: resultado['placa'].toString());
      print(carro.nome);
      return carro;
    } catch (e) {
      throw Exception('classe TreinoDAO, método consultar');
    } finally {}
  }

  @override
  Future<List<DtoCarro>> listarCarros() async {
    late Database db;
    try {
      const sql = 'SELECT * FROM carro';
      db = await Conexao.abrirConexao();
      List<Map<String, Object?>> resultados = (await db.rawQuery(sql));
      List<DtoCarro> carros = resultados.map((resultado) {
        return DtoCarro(
            id: resultado['id'] as int,
            nome: resultado['nome'].toString(),
            placa: resultado['placa'].toString());
      }).toList();

      return carros;
    } catch (e) {
      throw Exception('classe DaoLocacao, método listar');
    } finally {}
  }
}
