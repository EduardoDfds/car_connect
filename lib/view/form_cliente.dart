import 'package:car_connect/domain/ddm_cliente.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/infra/dao_carro_sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCliente extends StatefulWidget {
  const FormCliente({super.key});

  @override
  State<FormCliente> createState() => _FormClienteState();
}

class _FormClienteState extends State<FormCliente> {
  TextEditingController nome = TextEditingController();
  TextEditingController cnh = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Cadastrar Cliente'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text('Nome'), hintText: 'Nome'),
                  controller: nome,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      label: Text('CNH'), hintText: 'CNH'),
                  controller: cnh,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                child: ElevatedButton(
                  child: const Text('Salvar cliente'),
                  onPressed: () {
                    DDMCliente ddmCliente = DDMCliente(
                        dtoCliente: DtoCliente(nome: nome.text, cnh: cnh.text));

                    var mensagem = ddmCliente.salvarCliente();
                    if (mensagem == 'Cliente cadastrado com sucesso!') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cliente cadastrado!'),
                          backgroundColor: Color.fromARGB(255, 11, 132, 225),
                        ),
                      );
                    }
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
