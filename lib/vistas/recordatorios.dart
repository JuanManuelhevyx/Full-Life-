import 'package:flutter/material.dart';
import 'package:curso_drawer/dafaults/db.dart';
import 'dart:core';

class RecordatoriosPage extends StatefulWidget {
  const RecordatoriosPage({Key? key}) : super(key: key);

  @override
  State<RecordatoriosPage> createState() => _RecordatoriosPageState();
}

class _RecordatoriosPageState extends State<RecordatoriosPage> {
  var db = DatabaseConnect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 15,
          ),
          Text(
            'Seleccione su medicamento',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
