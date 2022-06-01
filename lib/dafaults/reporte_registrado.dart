import 'package:flutter/material.dart';
import 'recordFiles.dart';
import 'package:intl/intl.dart';

class ReportCards extends StatefulWidget {
  int? idReporte;
  DateTime fechaReporte;
  final int presion;
  final int frecuenciaCardiaca;
  final int nivelDeAzucar;
  final int presionVal2;
  final Function deleteFunctionReport;

  ReportCards(
      {required this.idReporte,
      required this.fechaReporte,
      required this.presion,
      required this.frecuenciaCardiaca,
      required this.nivelDeAzucar,
      required this.presionVal2,
      required this.deleteFunctionReport,
      Key? key})
      : super(key: key);

  @override
  State<ReportCards> createState() => _ReportCardsState();
}

class _ReportCardsState extends State<ReportCards> {
  @override
  Widget build(BuildContext context) {
    var otrosReportes = Reporte(
        idReporte: widget.idReporte,
        fechaReporte: widget.fechaReporte,
        presion: widget.presion,
        frecuenciaCardiaca: widget.frecuenciaCardiaca,
        nivelDeAzucar: widget.nivelDeAzucar,
        presionVal2: widget.presionVal2);
    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Fecha del reporte: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMd().add_jm().format(widget.fechaReporte),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      'Presión arterial: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.presion.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      '/',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.presionVal2.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      ' mmHg',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      'Frecuencia cardiaca: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.frecuenciaCardiaca.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      ' Prbpm',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      'Nivel de azucar: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.nivelDeAzucar.toString(),
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Text(
                      ' mg/dl',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              widget.deleteFunctionReport(otrosReportes);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
