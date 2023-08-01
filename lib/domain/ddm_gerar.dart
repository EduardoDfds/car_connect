import 'dart:io';

import 'package:car_connect/domain/dto/dto_resultado_locacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:flutter_pdfview/flutter_pdfview.dart';

class GerarPdf {
  DtoResultadoLocacao dtoResultadoLocacao;
  BuildContext context;

  GerarPdf({required this.dtoResultadoLocacao, required this.context});

  Future<void> generatePDF() async {
    var data = dtoResultadoLocacao.dataLocacao;
    final pdf = pw.Document();
    final String mensagem =
        '''Parabéns ${dtoResultadoLocacao.nomeCliente}, sua locação foi realizada com sucesso\nCarro: ${dtoResultadoLocacao.carro}\nData:${DateFormat('dd/MM/yyyy').format(data)}
    ''';
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(mensagem, style: pw.TextStyle(fontSize: 40)),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/example.pdf');
    await file.writeAsBytes(await pdf.save());
  }

  void viewPDF() async {
    final output = await getTemporaryDirectory();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFView(
          filePath: '${output.path}/example.pdf',
        ),
      ),
    );
  }
}
