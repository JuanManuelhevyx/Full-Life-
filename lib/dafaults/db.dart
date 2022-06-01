import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'recordFiles.dart';

class DatabaseConnect {
  static Database? _database;

  Future<Database> get database async {
    final dbpath = await getDatabasesPath();
    const dbname = 'medAdvisor.db';
    final path = join(dbpath, dbname);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medicamentos(
        idMedicamento INTEGER PRIMARY KEY AUTOINCREMENT,
        nombreMedicamento TEXT NOT NULL,
        dosificacion INTEGER,
        presentacion TEXT,
        fechaCad TEXT,
        cantidadXEnvase INTEGER,
        viaAdministracion TEXT,
        precio INTEGER,
        fIngresoMed TEXT,
        cadaCuantasHrs TEXT,
        horaIniIngesta TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE reporte(
        idReporte INTEGER PRIMARY KEY AUTOINCREMENT,
        fechaReporte TEXT NOT NULL,
        presion INTEGER,
        frecuenciaCardiaca INTEGER,
        nivelDeAzucar INTEGER,
        presionVal2 INTEGER
      );
''');
  }

  Future<void> insertMeds(Medicamentos medicamentos) async {
    final db = await database;

    await db.insert('medicamentos', medicamentos.toMapMed(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertReports(Reporte reporte) async {
    final db = await database;
    await db.insert('reporte', reporte.toMapReport(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Funciones para borrar datos

  Future<void> deleteMeds(Medicamentos medicamentos) async {
    final db = await database;

    await db.delete('medicamentos',
        where: 'idMedicamento == ?', whereArgs: [medicamentos.idMedicamento]);
  }

  Future<void> deleteReports(Reporte reporte) async {
    final db = await database;

    await db.delete('reporte',
        where: 'idReporte == ?', whereArgs: [reporte.idReporte]);
  }

  // Funciones para consultar todos los campos

  Future<List<Medicamentos>> getMeds() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('medicamentos', orderBy: 'idMedicamento DESC');

    return List.generate(
      items.length,
      (i) => Medicamentos(
          idMedicamento: items[i]['idMedicamento'],
          nombreMedicamento: items[i]['nombreMedicamento'],
          dosificacion: items[i]['dosificacion'],
          presentacion: items[i]['presentacion'],
          fechaCad: items[i]['fechaCad'],
          cantidadXEnvase: items[i]['cantidadXEnvase'],
          viaAdministracion: items[i]['viaAdministracion'],
          precio: items[i]['precio'],
          fIngresoMed: DateTime.parse(items[i]['fIngresoMed']),
          cadaCuantasHrs: items[i]['cadaCuantasHrs'],
          horaIniIngesta: items[i]['horaIniIngesta']),
    );
  }

  Future<List<Reporte>> getReport() async {
    final db = await database;
    List<Map<String, dynamic>> items =
        await db.query('reporte', orderBy: 'idReporte DESC');

    return List.generate(
      items.length,
      (i) => Reporte(
          idReporte: items[i]['idReporte'],
          fechaReporte: DateTime.parse(items[i]['fechaReporte']),
          presion: items[i]['presion'],
          frecuenciaCardiaca: items[i]['frecuenciaCardiaca'],
          nivelDeAzucar: int.parse(items[i]['nivelDeAzucar']),
          presionVal2: items[i]['presionVal2']),
    );
  }
}
