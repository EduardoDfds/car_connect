import 'package:car_connect/infra/banco/sqlflite/script_db.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class Conexao {
  static Database? _db;

  static Future<Database> abrirConexao() async {
    //sqfliteFfiInit();
    if (_db == null) {
      String caminho = join(await getDatabasesPath(), 'banco.db');
      //deleteDatabase(caminho);
      _db = await openDatabase(
        caminho,
        version: 1,
        onCreate: (db, version) {
          for (var comando in criarBanco) {
            db.execute(comando);
          }
        },
      );
    }
    return _db!;
  }
}
