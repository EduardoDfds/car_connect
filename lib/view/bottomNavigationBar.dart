import 'package:car_connect/view/form_carro.dart';
import 'package:car_connect/view/form_cliente.dart';
import 'package:car_connect/view/form_locacao.dart';
import 'package:car_connect/view/list_locacoes.dart';
import 'package:flutter/material.dart';

int _currentIndex = 0;

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _pages = [
    FormLocacao(),
    FormCliente(),
    FormCarro(),
    ListaLocacoes()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.home, color: Colors.amber),
            label: 'Realizar Locacão',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.person, color: Colors.amber),
            label: 'Cadastro cliente',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.settings, color: Colors.amber),
            label: 'Cadastro carro',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(Icons.car_crash_sharp, color: Colors.amber),
            label: 'Locações',
          ),
        ],
      ),
    );
  }
}
