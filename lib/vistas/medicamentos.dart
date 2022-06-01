import 'package:curso_drawer/dafaults/recordFiles.dart';
import 'package:flutter/material.dart';
import '../dafaults/meds_inputs.dart';
import '../dafaults/db.dart';

class MedicamentosPage extends StatefulWidget {
  const MedicamentosPage({Key? key}) : super(key: key);

  @override
  State<MedicamentosPage> createState() => _MedicamentosPageState();
}

class _MedicamentosPageState extends State<MedicamentosPage> {
  var db = DatabaseConnect();

  void addMeds(Medicamentos medicamentos) async {
    await db.insertMeds(medicamentos);
    setState(() {});
  }

  void delMeds(Medicamentos medicamentos) async {
    await db.deleteMeds(medicamentos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              MedsInput(insertFunctionMeds: addMeds),
            ],
          ),
        ],
      ),
    );
  }
}
