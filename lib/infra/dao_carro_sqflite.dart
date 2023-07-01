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
        await db.rawInsert(sql, [dtoCarro.id, dtoCarro.nome, dtoCarro.placa]);
    return linhasAfetadas > 0;
  }
}
