import 'package:curso_drawer/dafaults/lista_meds.dart';
import 'package:curso_drawer/dafaults/recordFiles.dart';
import 'package:flutter/material.dart';
import '../dafaults/db.dart';

class VerMedicamentos extends StatefulWidget {
  const VerMedicamentos({Key? key}) : super(key: key);

  @override
  State<VerMedicamentos> createState() => _VerMedicamentosState();
}

class _VerMedicamentosState extends State<VerMedicamentos> {
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
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: const Text('Medicamentos registrados'),
      ),
      body: Column(
        children: [
          MedsLista(
            deleteFunctionMeds: delMeds,
            insertFunctionMeds: addMeds,
          )
        ],
      ),
    );
  }
}
