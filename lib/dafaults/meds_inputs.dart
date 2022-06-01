import 'package:curso_drawer/vistas/ver_meds.dart';
import 'package:flutter/material.dart';
import 'recordFiles.dart';

class MedsInput extends StatelessWidget {
  String nombreMed = '';
  int dosisMed = 0;
  String presentMed = '';
  String fechaCadMed = '';
  int cantXEnvMed = 0;
  String viaAdminMed = '';
  int precioMed = 0;
  String cadaCuantasHrs = '';
  String horaIniIngesta = '';

  final Function insertFunctionMeds;
  MedsInput({required this.insertFunctionMeds, Key? key}) : super(key: key);

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
                  'Nombre del medicamento',
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
                    labelText: 'ej: paracetamól',
                    labelStyle: TextStyle(fontSize: 25, color: Colors.black26),
                  ),
                  onSaved: (value) {
                    nombreMed = value.toString();
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
                        'Dosificación del farmaco',
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
                          labelText: 'ej: 2',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          dosisMed = int.parse(value.toString());
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
                        'Presentación del medicamento',
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
                          labelText: 'ej: tabletas',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          presentMed = value.toString();
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
                        'Fecha de caducidad',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.datetime,
                        style: const TextStyle(fontSize: 23),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3)),
                          labelText: 'ej: dd/mm/aaaa',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          fechaCadMed = value.toString();
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
                        'Cantidad del medicamento',
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
                          labelText: 'ej: 50',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          cantXEnvMed = int.parse(value.toString());
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
                        'Vía de administración',
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
                          labelText: 'ej: oral',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          viaAdminMed = value.toString();
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
                        'Precio del medicamento',
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
                          labelText: 'ej: 500',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          precioMed = int.parse(value.toString());
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
                        'Cada cuantas horas',
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
                          labelText: 'ej: 6',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          cadaCuantasHrs = value!;
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
                          labelText: 'ej: 12:00 PM',
                          labelStyle:
                              TextStyle(fontSize: 25, color: Colors.black26),
                        ),
                        onSaved: (value) {
                          horaIniIngesta = value!;
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
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var misMeds = Medicamentos(
                        nombreMedicamento: nombreMed,
                        dosificacion: dosisMed,
                        presentacion: presentMed,
                        fechaCad: fechaCadMed,
                        cantidadXEnvase: cantXEnvMed,
                        viaAdministracion: viaAdminMed,
                        precio: precioMed,
                        fIngresoMed: DateTime.now(),
                        cadaCuantasHrs: cadaCuantasHrs,
                        horaIniIngesta: horaIniIngesta,
                      );
                      insertFunctionMeds(misMeds);
                    }
                  },
                  child: const Text(
                    'Guardar',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerMedicamentos()));
                  },
                  child: const Text('Ver medicamentos',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)))
            ],
          ),
        ],
      ),
    );
  }
}
