import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/services/auth/auth_spotify.dart';
import 'package:proyecto_sw1/src/services/auth/get_access_token.dart';
import 'package:proyecto_sw1/src/widgets/texto_gradiente.dart';
import 'package:uni_links/uni_links.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _listenToRedirects();
  }

  void _listenToRedirects() {
    // ignore: deprecated_member_use
    _sub = getUriLinksStream().listen((Uri? uri) {
      if (uri != null && uri.toString().startsWith('myapp://callback')) {
        final String? code = uri.queryParameters['code'];
        if (code != null) {
          getAccessToken(code, context);
        }
      }
    }, onError: (err) {});
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 21, 23, 43),
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
          authenticateWithSpotify();
          // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          //   return const LoginPage();
          // }));
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
