// paquetes o dependencias usadas en el desarrollo de la app

import 'package:curso_drawer/dafaults/defaults.dart';
import 'package:curso_drawer/vistas/configuracion.dart';
import 'package:curso_drawer/vistas/medicamentos.dart';
import 'package:curso_drawer/vistas/presion.dart';
import 'package:curso_drawer/vistas/reporte.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'vistas/resumen.dart';

// Funcion que lanza la app (por defecto)
Future<void> main(List<String> args) async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Se asegura que se inicién los paquetes antes de lanzar la app
  runApp(const MyApp());
}

// llama a la pantalla principal y gestiona el estilo de la app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0x0aa22411),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: const Color.fromARGB(9, 74, 36, 162))));
  }
}

// variable para indicar el objeto del menú al cual se le hizo click
var indexClicked = 0;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Texto de las opciones del menu
  final pages = [
    const Center(
      child: Text(
        'RESUMEN',
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Center(
      child: Text('MEDICAMENTOS', style: TextStyle(color: Colors.black)),
    ),
    // const Center(
    //   child: Text('RECORDATORIOS', style: TextStyle(color: Colors.black)),
    // ),
    const Center(
      child: Text('PRESIÓN', style: TextStyle(color: Colors.black)),
    ),
    const Center(
      child: Text('REPORTE', style: TextStyle(color: Colors.black)),
    ),
    const Center(
      child: Text('INFORMACIÓN', style: TextStyle(color: Colors.black)),
    ),
  ];

// Permite actulizar al objeto clickeado
  VoidCallback updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;
      });
      Navigator.pop(context);
    };
  }

// Directorio de vistas
  getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const ResumenPage();
      case 1:
        return const MedicamentosPage();
      // case 2:
      //   return const RecordatoriosPage();
      case 2:
        return const PresionPage();
      case 3:
        return const ReportePage();
      case 4:
        return ConfiguracionPage();
      default:
    }
  }

// El cuerpo del appbar y el menu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //la barra superior
        backgroundColor: Colors.green[200],
        actions: const [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('assets/images/fl_profile.jpeg'),
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
        title: pages[indexClicked],
      ),
      body: getDrawerItemWidget(indexClicked),
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/drawer.jpg'),
              ),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/fl_profile.jpeg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Perfíl Full Life',
                  style: GoogleFonts.sanchez(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  DateFormat.jm().format(DateTime.now()).toString(),
                  style: GoogleFonts.sanchez(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                AppDrawerTile(
                  index: 0,
                  onTap: updateState(0),
                ),
                AppDrawerTile(
                  index: 1,
                  onTap: updateState(1),
                ),
                // AppDrawerTile(
                //   index: 2,
                //   onTap: updateState(2),
                // ),
                AppDrawerTile(
                  index: 2,
                  onTap: updateState(2),
                ),
                AppDrawerTile(
                  index: 3,
                  onTap: updateState(3),
                ),
                const SizedBox(
                  height: 8,
                ),
                const AppDrawerDivider(),
                const SizedBox(
                  height: 8,
                ),
                AppDrawerTile(
                  index: 4,
                  onTap: updateState(4),
                ),
                const SizedBox(
                  height: 30,
                ),
                const AppDrawerDivider(),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(
                    'Full Life',
                    style: GoogleFonts.sanchez(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: Defaults.drawerItemSelectedColor),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    'PRE-ALFA \n Versión 1.0.0',
                    style: GoogleFonts.sanchez(
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        color: Defaults.drawerItemColor),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const AppDrawerDivider(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Defaults.drawerItemColor,
      indent: 5,
      endIndent: 5,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: GoogleFonts.sanchez(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: indexClicked == index
                  ? Defaults.drawerItemSelectedColor
                  : Defaults.drawerItemColor),
        ),
      ),
    );
  }
}
