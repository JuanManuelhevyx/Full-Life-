import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfiguracionPage extends StatefulWidget {
  final now = DateTime.now();

  ConfiguracionPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  final now = DateFormat.jm().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                '''Esta aplicación fué desarrollada con el fin de ayudarte a recordar las pastillas que debes tomar mediante recordatorios\n
en el siguiente link podrás encontrar un manual de usuario, el cuál recomendamos leer para entender esta versión de la aplicación, la cuál está en fase pre-Alfa\n
''',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    _launch(documentacionFL);
                  },
                  child: const Text('ir'))
            ],
          ),
        ),
      ),
    );
  }

  Uri documentacionFL = Uri.parse(
      'https://drive.google.com/file/d/1sE5oBmeFMuJlMksMYGJLSw830kyf5ahg/view?usp=drivesdk');
  Uri googleUrl = Uri.parse('https://www.facebook.com/');

  Future<void> _launch(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : print('could_not_launch_this_app');
  }
}
