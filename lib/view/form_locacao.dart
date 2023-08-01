import 'package:car_connect/domain/ddm_locacao.dart';
import 'package:car_connect/domain/dto/dto_carro.dart';
import 'package:car_connect/domain/dto/dto_cliente.dart';
import 'package:car_connect/domain/dto/dto_locacao.dart';
import 'package:car_connect/domain/dto/dto_resultado_locacao.dart';
import 'package:car_connect/infra/dao_carro_sqflite.dart';
import 'package:car_connect/infra/dao_cliente_sqflite.dart';
import 'package:car_connect/infra/enviar_mensagem_locacao.dart';
import 'package:car_connect/view/confirmacao_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormLocacao extends StatefulWidget {
  const FormLocacao({super.key});

  @override
  State<FormLocacao> createState() => _FormLocacaoState();
}

class _FormLocacaoState extends State<FormLocacao> {
  DtoCliente? cliente;
  List<DtoCliente> clientes = [];
  DtoCarro? carro;
  List<DtoCarro> carros = [];
  TextEditingController dataFim = TextEditingController();
  TextEditingController dataInicio = TextEditingController();
  TextEditingController assunto = TextEditingController();
  TextEditingController destinatario = TextEditingController();

  @override
  void initState() {
    assunto.text = 'Confirmação de locação';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget dropDownCliente() {
      return FutureBuilder(
        future: DaoCliente().listarClientess(),
        builder: (context, AsyncSnapshot<List<DtoCliente>> dados) {
          var clientes = dados.data;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<DtoCliente>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: const Text('Cliente'),
              items: clientes!
                  .map<DropdownMenuItem<DtoCliente>>((DtoCliente cliente) {
                return DropdownMenuItem<DtoCliente>(
                    value: cliente, child: Text(cliente.nome));
              }).toList(),
              onChanged: (cliente) {
                ///nomeTreino = treino!.nome;
                this.cliente = cliente;
              },
            ),
          );
        },
      );
    }

    Widget dropDownCarro() {
      return FutureBuilder(
        future: DaoCarro().listarCarros(),
        builder: (context, AsyncSnapshot<List<DtoCarro>> dados) {
          var carros = dados.data;
          return SizedBox(
            width: 300,
            height: 100,
            child: DropdownButtonFormField<DtoCarro>(
              isExpanded: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
              hint: const Text('Carro'),
              items: carros!.map<DropdownMenuItem<DtoCarro>>((DtoCarro carro) {
                return DropdownMenuItem<DtoCarro>(
                    value: carro, child: Text(carro.nome + ' ' + carro.placa));
              }).toList(),
              onChanged: (carro) {
                ///nomeTreino = treino!.nome;
                this.carro = carro;
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Locar Carro'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dropDownCarro(),
              dropDownCliente(),
              SizedBox(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      label: Text('Inicio:'), hintText: 'Inicio'),
                  controller: dataInicio,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 300,
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      label: Text('Fim'), hintText: 'Fim'),
                  controller: dataFim,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                child: ElevatedButton(
                  child: const Text('Realizar Locação'),
                  onPressed: () async {
                    DateFormat format = DateFormat('dd/MM/yyyy');
                    DateTime dateTimefim = format.parse(dataFim.text);
                    DateTime dateTimeInicio = format.parse(dataInicio.text);
                    DtoLocacao locacao = DtoLocacao(
                        dadosCarro: carro!,
                        dadosCliente: cliente!,
                        dataFim: dateTimefim,
                        dataInicio: dateTimeInicio);
                    DDMLocacao ddmLocacao = DDMLocacao(dtoLocacao: locacao);
                    var mensagem2 = EnviarMensagemLocacao().enviarMensagem(
                      DtoResultadoLocacao(dtoLocacao: locacao),
                    );

                    var mensagem = await ddmLocacao.salvarLocao();
                    if (mensagem == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ConfirmacaoView(
                            mensagem: mensagem2,
                            locacao: locacao,
                            destinatario: destinatario.text,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Locação não realizada!, cliente ou veiculo ja possui locação para essa data!'),
                          backgroundColor: Colors.redAccent,
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
