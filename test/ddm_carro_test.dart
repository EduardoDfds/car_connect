import 'package:car_connect/domain/ddm_carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late DtoCarro dtoCarro = DtoCarro(nome: 'gol', placa: 'ABC1C23');
  DDMCarro ddmCarro = DDMCarro(dtoCarro: dtoCarro);

  setUp(() async {
    sqfliteFfiInit();
    DatabaseFactory? databaseFactoryFfi;
    databaseFactory = databaseFactoryFfi;
    String caminho = join(await getDatabasesPath(), 'banco.db');
    deleteDatabase(caminho);
    db = await Conexao
        .abrirConexao(); // permite fazer os testes sem precisar do android
  });

  test("Salvar carro", () async {
    String mensagem = ddmCarro.salvarCarro();

    expect(mensagem, 'Carro cadastrado com sucesso!');
  });
}

void sqfliteFfiInit() {}
