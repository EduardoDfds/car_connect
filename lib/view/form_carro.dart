import 'package:car_connect/domain/ddm_carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:flutter/material.dart';

class FormCarro extends StatelessWidget {
  const FormCarro({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nome = TextEditingController();
    TextEditingController placa = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de carro '),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                height: 100,
                child: TextFormField(
                  controller: nome,
                  decoration: const InputDecoration(
                      label: Text('Nome'), hintText: 'Nome do carro'),
                  onChanged: (valorDigiado) {},
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: TextFormField(
                  controller: placa,
                  decoration: const InputDecoration(
                      label: Text('Placa'), hintText: 'Placa do carro'),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                child: ElevatedButton(
                  child: const Text('Salvar carro'),
                  onPressed: () {
                    DDMCarro ddmCarro = DDMCarro(
                        dtoCarro: DtoCarro(nome: nome.text, placa: placa.text));
                    var mensagem = ddmCarro.salvarCarro();
                    if (mensagem == 'Carro cadastrado com sucesso!') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Veiculo cadastrado!'),
                          backgroundColor: Color.fromARGB(255, 11, 132, 225),
                        ),
                      );
                    }

                    //Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
