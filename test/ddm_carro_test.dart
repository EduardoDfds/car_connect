import 'package:car_connect/domain/ddm_carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late DtoCarro dtoCarro = DtoCarro(nome: 'gol', placa: 'ABC1C23');
  DDMCarro ddmCarro = DDMCarro(dtoCarro: dtoCarro);

  test("Salvar carro", () {
    String mensagem = ddmCarro.salvarCarro();

    expect(mensagem, 'Carro salvo com sucesso');
  });
}
