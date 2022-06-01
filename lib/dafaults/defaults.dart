import 'package:flutter/material.dart';

// Colores principalesque usa el menu desplegable

class Defaults {
  static final Color? drawerItemColor = Colors.blueGrey[900];
  static final Color? drawerItemSelectedColor = Colors.orange[800];
  static final Color? drawerSelectedTileColor = Colors.blue[100];

// lista de nombres de los items del menu desplegable

  static final drawerItemText = [
    'RESUMEN',
    'MEDICAMENTOS',
    // 'RECORDATORIOS',
    'PRESIÓN',
    'REPORTE',
    'INFORMACIÓN',
  ];

  // Lista de iconos de las opciones del menu desplegable

  static final drawerItemIcon = [
    Icons.home,
    Icons.wysiwyg_sharp,
    // Icons.notifications_active_outlined,
    Icons.done_rounded,
    Icons.checklist_sharp,
    Icons.info,
  ];
}
