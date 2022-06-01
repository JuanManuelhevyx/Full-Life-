import 'package:flutter/material.dart';

class ResumeCards extends StatefulWidget {
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

  ResumeCards(
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
  State<ResumeCards> createState() => _ResumeCardsState();
}

class _ResumeCardsState extends State<ResumeCards> {
  @override
  Widget build(BuildContext context) {
    // var otroMedicamentos = Medicamentos(
    //     idMedicamento: widget.idMedicamento,
    //     nombreMedicamento: widget.nombreMedicamento,
    //     dosificacion: widget.dosificacion,
    //     presentacion: widget.presentacion,
    //     fechaCad: widget.fechaCad,
    //     cantidadXEnvase: widget.cantidadXEnvase,
    //     viaAdministracion: widget.viaAdministracion,
    //     precio: widget.precio,
    //     fIngresoMed: widget.fIngresoMed,
    //     cadaCuantasHrs: widget.cadaCuantasHrs,
    //     horaIniIngesta: widget.horaIniIngesta);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12, top: 12),
      //  width: SizeConfig.screenWidth * 0.78,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.amber),
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
                    const Text(
                      'Se debe tomar cada ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cadaCuantasHrs.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const Text(
                      ' horas',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     widget.deleteFunctionMeds(otroMedicamentos);
          //   },
          //   icon: const Icon(Icons.close),
          // ),
        ],
      ),
    );
  }
}
