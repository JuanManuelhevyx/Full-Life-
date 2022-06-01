class Medicamentos {
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

// Crear el constructor
  Medicamentos(
      {this.idMedicamento,
      required this.nombreMedicamento,
      required this.dosificacion,
      required this.presentacion,
      required this.fechaCad,
      required this.cantidadXEnvase,
      required this.viaAdministracion,
      required this.precio,
      required this.fIngresoMed,
      required this.cadaCuantasHrs,
      required this.horaIniIngesta});

  Map<String, dynamic> toMapMed() {
    return {
      'idMedicamento': idMedicamento,
      'nombreMedicamento': nombreMedicamento,
      'dosificacion': dosificacion,
      'presentacion': presentacion,
      'fechaCad': fechaCad,
      'cantidadXEnvase': cantidadXEnvase,
      'viaAdministracion': viaAdministracion,
      'precio': precio,
      'fIngresoMed': fIngresoMed.toString(),
      'cadaCuantasHrs': cadaCuantasHrs,
      'horaIniIngesta': horaIniIngesta,
    };
  }

  @override
  String toString() {
    return 'Medicamentos(idMedicamento : $idMedicamento, nombreMedicamento : $nombreMedicamento, dosificacion : $dosificacion, presentacion $presentacion, fechaCad : $fechaCad, cantidadXEnvase : $cantidadXEnvase, viaAdministracion : $viaAdministracion, precio : $precio, fIngresoMed : $fIngresoMed, cadaCuantasHrs : $cadaCuantasHrs, horaIniIngesta : $horaIniIngesta)';
  }
}

class Reporte {
  int? idReporte;
  DateTime fechaReporte;
  final int presion;
  final int frecuenciaCardiaca;
  final int nivelDeAzucar;
  final int presionVal2;

  Reporte(
      {this.idReporte,
      required this.fechaReporte,
      required this.presion,
      required this.frecuenciaCardiaca,
      required this.nivelDeAzucar,
      required this.presionVal2});

  Map<String, dynamic> toMapReport() {
    return {
      'idReporte': idReporte,
      'fechaReporte': fechaReporte.toString(),
      'presion': presion,
      'frecuenciaCardiaca': frecuenciaCardiaca,
      'nivelDeAzucar': nivelDeAzucar,
      'presionVal2': presionVal2
    };
  }

  @override
  String toString() {
    return 'Reporte(idReporte : $idReporte, fechaReporte : $fechaReporte, presion : $presion, frecuenciaCardiaca : $frecuenciaCardiaca, nivelDeAzucar : $nivelDeAzucar, presionVal2 : $presionVal2)';
  }
}
