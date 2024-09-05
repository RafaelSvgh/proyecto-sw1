import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/pages/login_page.dart';
import 'package:proyecto_sw1/src/widgets/texto_gradiente.dart';

class VistaInicial extends StatelessWidget {
  const VistaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x0015172b),
      body: _inicio(context),
    );
  }

  Column _inicio(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _titulo(),
        _imagenAstronauta(),
        _botonInicioSesion(context),
        const SizedBox(
          height: 20,
        ),
        _imagenSpotify()
      ],
    );
  }

  Image _imagenSpotify() {
    return Image.asset(
      'assets/images/img-2.png',
      width: 250,
    );
  }

  TextButton _botonInicioSesion(BuildContext context) {
    return TextButton(
        onPressed: () {
          
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return const LoginPage();
          }));
        },
        child: const Text(
          'Iniciar Sesión',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
        ));
  }

  Image _imagenAstronauta() {
    return Image.asset(
      'assets/images/img-1.gif',
    );
  }

  GradientText _titulo() {
    return const GradientText(
        text: 'Reproductor \nColaborativo',
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 14, 62, 144),
          Color.fromARGB(119, 20, 57, 157)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter));
  }
}
