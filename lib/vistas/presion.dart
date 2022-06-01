import 'package:curso_drawer/dafaults/presion_inputs.dart';
import 'package:curso_drawer/dafaults/recordFiles.dart';
import 'package:flutter/material.dart';

import '../dafaults/db.dart';

class PresionPage extends StatefulWidget {
  const PresionPage({Key? key}) : super(key: key);

  @override
  State<PresionPage> createState() => _PresionPageState();
}

class _PresionPageState extends State<PresionPage> {
  void addReports(Reporte reporte) async {
    var db = DatabaseConnect();
    await db.insertReports(reporte);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [ReportsInput(insertFunctionReport: addReports)],
      ),
    );
  }
}
