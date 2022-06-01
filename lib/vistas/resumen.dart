import 'package:curso_drawer/dafaults/servicio_notificaciones.dart';
import 'package:flutter/material.dart';
import '../dafaults/db.dart';
import '../dafaults/lista_meds.dart';
import '../dafaults/recordFiles.dart';

class ResumenPage extends StatefulWidget {
  const ResumenPage({Key? key}) : super(key: key);

  @override
  State<ResumenPage> createState() => _ResumenPageState();
}

class _ResumenPageState extends State<ResumenPage> {
  var db = DatabaseConnect();

  void addMeds(Medicamentos medicamentos) async {
    await db.insertMeds(medicamentos);
    setState(() {});
  }

  void delMeds(Medicamentos medicamentos) async {
    await db.deleteMeds(medicamentos);
    setState(() {});
  }

  late var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ResumeLista(
            deleteFunctionMeds: delMeds,
            insertFunctionMeds: addMeds,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     notifyHelper.displayNotification(
          //         title: 'hola', body: 'La notificación funciona');
          //     // notifyHelper.scheduledNotification();
          //   },
          //   child: const Text('Notificación'),
          // )
        ],
      ),
    );
  }
}
