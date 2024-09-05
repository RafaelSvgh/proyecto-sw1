import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/pages/vista_inicial.dart';

class Aa extends StatelessWidget {
  const Aa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return const VistaInicial();
            }));
          },
          child: const Text('Siguiente'),
        ),
      ),
    );
  }
}
