import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/infra/dao_locacao_sqflite.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListaLocacoes extends StatefulWidget {
  const ListaLocacoes({Key? key}) : super(key: key);

  @override
  State<ListaLocacoes> createState() => _ListaLocacoesState();
}

class _ListaLocacoesState extends State<ListaLocacoes> {
  DaoLocacao daoLocacao = DaoLocacao();
  @override
  Widget build(BuildContext context) {
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> treino = argumento as Map<String, Object?>;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Locações'),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: daoLocacao.listarLocacoes(),
            builder: (context, AsyncSnapshot<List<DtoLocacao>> dados) {
              if (!dados.hasData) {
                return const CircularProgressIndicator();
              }
              var locacoes = dados.data!;

              return ListView.builder(
                itemCount: locacoes.length,
                itemBuilder: (context, index) {
                  var locacao = locacoes[index];

                  return Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 89, 192, 37),
                          child: Icon(Icons.car_repair_outlined),
                        ),
                        title: Text(
                          '''Cliente: ${locacao.dadosCliente.nome}''',
                          style: TextStyle(fontSize: 25),
                        ),
                        subtitle: Text(
                            '''Veiculo: ${locacao.dadosCarro.nome} - ${locacao.dadosCarro.placa}\nData locacão: ${DateFormat('dd/MM/yyyy').format(locacao.dataInicio).toString()}'''),
                        trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                            onPressed: () {}),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
