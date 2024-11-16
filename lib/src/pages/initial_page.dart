import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/pages/login_page.dart';
import 'package:proyecto_sw1/src/pages/register_page.dart';
import 'package:proyecto_sw1/src/widgets/texto_gradiente.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 21, 23, 43),
      body: _inicio(context),
    );
  }

  Column _inicio(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titulo(),
        _imagenAstronauta(),
        _botonInicioSesion(context),
        _botonRegistro()
      ],
    );
  }

  TextButton _botonInicioSesion(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginPage()));
        },
        child: const Text(
          'Iniciar Sesión',
          style: TextStyle(
              color: Color.fromARGB(255, 235, 235, 235),
              fontWeight: FontWeight.w700,
              fontSize: 25),
        ));
  }

  Widget _botonRegistro() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes una cuenta?',
          style: TextStyle(color: Color.fromARGB(255, 235, 235, 235)),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterPage(),
              ));
            },
            child: const Text(
              'Regístrate',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ))
      ],
    );
  }

  Image _imagenAstronauta() {
    return Image.asset(
      'assets/images/img-1.gif',
    );
  }

  Widget _titulo() {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: const GradientText(
          text: 'Reproductor \nColaborativo',
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 14, 62, 144),
            Color.fromARGB(119, 20, 57, 157)
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
