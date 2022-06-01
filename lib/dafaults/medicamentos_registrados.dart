import 'package:cron/cron.dart';
import 'package:curso_drawer/dafaults/servicio_notificaciones.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'recordFiles.dart';
import 'package:intl/intl.dart';

class MedCards extends StatefulWidget {
  int? idMedicamento;
  final String nombreMedicamento;
  final int dosificacion;
  final String presentacion;
  final String fechaCad;
  final int cantidadXEnvase;
  final String viaAdministracion;
  final int precio;
  DateTime fIngresoMed;
  final String cadaCuantasHrs;
  final String horaIniIngesta;
  final Function insertFunctionMeds;
  final Function deleteFunctionMeds;

  MedCards(
      {required this.idMedicamento,
      required this.nombreMedicamento,
      required this.dosificacion,
      required this.presentacion,
      required this.fechaCad,
      required this.cantidadXEnvase,
      required this.viaAdministracion,
      required this.precio,
      required this.fIngresoMed,
      required this.insertFunctionMeds,
      required this.deleteFunctionMeds,
      required this.cadaCuantasHrs,
      required this.horaIniIngesta,
      Key? key})
      : super(key: key);

  @override
  State<MedCards> createState() => _MedCardsState();
}

class _MedCardsState extends State<MedCards> {
  final cron = Cron();
  var _switch = 1.obs;

  late var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
  }

  @override
  Widget build(BuildContext context) {
    var otroMedicamentos = Medicamentos(
        idMedicamento: widget.idMedicamento,
        nombreMedicamento: widget.nombreMedicamento,
        dosificacion: widget.dosificacion,
        presentacion: widget.presentacion,
        fechaCad: widget.fechaCad,
        cantidadXEnvase: widget.cantidadXEnvase,
        viaAdministracion: widget.viaAdministracion,
        precio: widget.precio,
        fIngresoMed: widget.fIngresoMed,
        cadaCuantasHrs: widget.cadaCuantasHrs,
        horaIniIngesta: widget.horaIniIngesta);

    if (DateFormat.jm().format(DateTime.now()) == widget.horaIniIngesta &&
        _switch == widget.idMedicamento.obs) {
      cron.schedule(
        Schedule.parse('*/${int.parse(widget.cadaCuantasHrs)} * * * * *'),
        () {
          notifyHelper.displayNotification(
              title: widget.nombreMedicamento,
              body: 'La notificación funciona');
        },
      );
      _switch++;
    } else {
      cron.close();
    }

    return Card(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Medicamento: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.nombreMedicamento,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Dosificación: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.dosificacion.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Presentación: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.presentacion,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('F. de Caducidad: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.fechaCad.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Cantidad envase ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.cantidadXEnvase.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Vía administración: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.viaAdministracion,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Precio: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      widget.precio.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text('Fecha de registro: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(
                      DateFormat.yMd().add_jm().format(widget.fIngresoMed),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
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
              widget.deleteFunctionMeds(otroMedicamentos);
              setState(() {
                _switch - 1;
              });
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}
