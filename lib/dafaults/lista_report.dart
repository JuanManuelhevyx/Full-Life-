import 'package:flutter/material.dart';
import 'reporte_registrado.dart';
import '../dafaults/db.dart';

class ReportLista extends StatelessWidget {
  final Function deleteFunctionReport;
  ReportLista({required this.deleteFunctionReport, Key? key}) : super(key: key);
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getReport(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalenght = data!.length;

          return datalenght == 0
              ? const Center(
                  child: Text(
                    'No hay reportes para mostrar',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : ListView.builder(
                  itemCount: datalenght,
                  itemBuilder: (context, i) => ReportCards(
                    idReporte: data[i].idReporte,
                    fechaReporte: data[i].fechaReporte,
                    presion: data[i].presion,
                    presionVal2: data[i].presionVal2,
                    frecuenciaCardiaca: data[i].frecuenciaCardiaca,
                    nivelDeAzucar: data[i].nivelDeAzucar,
                    deleteFunctionReport: deleteFunctionReport,
                  ),
                );
        },
      ),
    );
  }
}
