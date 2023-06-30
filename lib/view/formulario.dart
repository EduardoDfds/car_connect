import 'package:car_connect/domain/ddm_carro.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  const Formulario({super.key});

  @override
  Widget build(BuildContext context) {
    late String nome;
    late String placa;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Carro'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                label: Text('Nome:'), hintText: 'Nome do carro'),
            onChanged: (valorDigitado) {
              nome = valorDigitado;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                label: Text('Placa'), hintText: 'Placa do carro'),
            onChanged: (valorDigitado) {
              placa = valorDigitado;
            },
          ),
          ElevatedButton(
            child: Text('Salvar carro'),
            onPressed: () {
              DDMCarro ddmCarro =DDMCarro(dtoCarro: DtoCarro(nome: nome, placa: placa));
              var mensagem = ddmCarro.salvarCarro();
              print(mensagem);
            },
          ),
          
        ],
      ),
    );
  }
}
