import 'package:car_connect/view/form_carro.dart';
import 'package:car_connect/view/form_cliente.dart';
import 'package:car_connect/view/form_locacao.dart';
import 'package:car_connect/view/list_locacoes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem Vindo!'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormLocacao(),
                  ),
                );
              },
              child: const Text('Realizar Locação'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListaLocacoes(),
                  ),
                );
              },
              child: const Text('Locações'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormCarro(),
                  ),
                );
              },
              child: const Text('Cadatrar veiculo'),
            ),
          ),
          SizedBox(
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormCliente(),
                  ),
                );
              },
              child: const Text('Cadastrar Cliente'),
            ),
          ),
        ]),
      ),
    );
  }
}
