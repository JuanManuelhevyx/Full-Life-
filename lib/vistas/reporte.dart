import 'package:flutter/material.dart';
import '../dafaults/lista_report.dart';
import '../dafaults/recordFiles.dart';
import '../dafaults/db.dart';

class ReportePage extends StatefulWidget {
  const ReportePage({Key? key}) : super(key: key);

  @override
  State<ReportePage> createState() => _ReportePageState();
}

class _ReportePageState extends State<ReportePage> {
  var db = DatabaseConnect();

  void delReports(Reporte reporte) async {
    await db.deleteReports(reporte);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReportLista(deleteFunctionReport: delReports),
        ],
      ),
    );
  }
}
