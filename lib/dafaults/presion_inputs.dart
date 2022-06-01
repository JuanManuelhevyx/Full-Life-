import 'package:curso_drawer/dafaults/recordFiles.dart';
import 'package:flutter/material.dart';

class ReportsInput extends StatelessWidget {
  int presion = 0;
  int presionVal2 = 0;
  int frecuenciaCardiaca = 0;
  int nivelDeAzucar = 0;
  final Function insertFunctionReport;
  ReportsInput({required this.insertFunctionReport, Key? key})
      : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          Container(
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Column(
                children: <Widget>[
                  const Text(
                    'Frecuencia cardiaca',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(fontSize: 23),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 3)),
                      labelText: 'ej: 80',
                      labelStyle:
                          TextStyle(fontSize: 25, color: Colors.black26),
                    ),
                    onSaved: (value) {
                      frecuenciaCardiaca = int.parse(value.toString());
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "llene este campo";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      const Text(
                        'Presión arterial primer valor',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 23),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3)),
                          labelText: 'ej: 120',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          presion = int.parse(value.toString());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "llene este campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      const Text(
                        'Presión arterial primer valor',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(fontSize: 23),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3)),
                          labelText: 'ej: 80',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          presionVal2 = int.parse(value.toString());
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "llene este campo";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.grey[200],
            child: Column(
              children: <Widget>[
                const Text(
                  'Nivel de azucar',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 23),
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 3)),
                    labelText: 'ej: 100',
                    labelStyle: TextStyle(fontSize: 25, color: Colors.black26),
                  ),
                  onSaved: (value) {
                    nivelDeAzucar = int.parse(value.toString());
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "llene este campo";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var miReporte = Reporte(
                      frecuenciaCardiaca: frecuenciaCardiaca,
                      presion: presion,
                      presionVal2: presionVal2,
                      nivelDeAzucar: nivelDeAzucar,
                      fechaReporte: DateTime.now(),
                    );
                    insertFunctionReport(miReporte);
                  }
                },
                child: const Text(
                  'Guardar',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
