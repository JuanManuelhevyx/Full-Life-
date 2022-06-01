import 'package:curso_drawer/dafaults/resumen_cards.dart';
import 'package:flutter/material.dart';
import 'medicamentos_registrados.dart';
import '../dafaults/db.dart';

class MedsLista extends StatelessWidget {
  final Function deleteFunctionMeds;
  final Function insertFunctionMeds;
  MedsLista(
      {required this.deleteFunctionMeds,
      required this.insertFunctionMeds,
      Key? key})
      : super(key: key);
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getMeds(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalenght = data!.length;

          return datalenght == 0
              ? const Center(
                  child: Text(
                    'No haz registrado ningun medicamento',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : ListView.builder(
                  itemCount: datalenght,
                  itemBuilder: (context, i) => MedCards(
                    idMedicamento: data[i].idMedicamento,
                    nombreMedicamento: data[i].nombreMedicamento,
                    dosificacion: data[i].dosificacion,
                    presentacion: data[i].presentacion,
                    fechaCad: data[i].fechaCad,
                    cantidadXEnvase: data[i].cantidadXEnvase,
                    viaAdministracion: data[i].viaAdministracion,
                    precio: data[i].precio,
                    fIngresoMed: data[i].fIngresoMed,
                    cadaCuantasHrs: data[i].cadaCuantasHrs,
                    horaIniIngesta: data[i].horaIniIngesta,
                    deleteFunctionMeds: deleteFunctionMeds,
                    insertFunctionMeds: insertFunctionMeds,
                  ),
                );
        },
      ),
    );
  }
}

class ResumeLista extends StatelessWidget {
  final Function deleteFunctionMeds;
  final Function insertFunctionMeds;
  ResumeLista(
      {required this.deleteFunctionMeds,
      required this.insertFunctionMeds,
      Key? key})
      : super(key: key);
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: db.getMeds(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          var data = snapshot.data;
          var datalenght = data!.length;

          return datalenght == 0
              ? const Center(
                  child: Text(
                    'No haz registrado ningun medicamento',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              : ListView.builder(
                  itemCount: datalenght,
                  itemBuilder: (context, i) {
                    return ResumeCards(
                      idMedicamento: data[i].idMedicamento,
                      nombreMedicamento: data[i].nombreMedicamento,
                      dosificacion: data[i].dosificacion,
                      presentacion: data[i].presentacion,
                      fechaCad: data[i].fechaCad,
                      cantidadXEnvase: data[i].cantidadXEnvase,
                      viaAdministracion: data[i].viaAdministracion,
                      precio: data[i].precio,
                      fIngresoMed: data[i].fIngresoMed,
                      cadaCuantasHrs: data[i].cadaCuantasHrs,
                      horaIniIngesta: data[i].horaIniIngesta,
                      deleteFunctionMeds: deleteFunctionMeds,
                      insertFunctionMeds: insertFunctionMeds,
                    );
                  });
        },
      ),
    );
  }
}
