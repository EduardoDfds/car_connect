import 'package:car_connect/domain/ddm_carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/infra/banco/sqlflite/conexao_db.dart';
import 'package:car_connect/infra/dao_carro_sqflite.dart';
import 'package:car_connect/infra/dao_cliente_sqflite.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late DtoCarro dtoCarro = DtoCarro(nome: 'gol', placa: 'ABC1C23');
  DDMCarro ddmCarro = DDMCarro(dtoCarro: dtoCarro);

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

  test("testando se a conexão está aberta", () {
    expect(db.isOpen, true);
  });

  test("Salvar carro", () async {
    String mensagem = ddmCarro.salvarCarro();

    expect(mensagem, isInstanceOf<String>());
  });

  test('description', () {
    var carro = DaoCarro().consultarCarro(3);
    var cliente = DaoCliente().consultarCliente(1);
  });
}
