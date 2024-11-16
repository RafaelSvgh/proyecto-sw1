import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto_sw1/src/pages/initial_page.dart';
import 'package:proyecto_sw1/src/pages/principal_page.dart';
import 'package:proyecto_sw1/src/widgets/texto_gradiente.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? token;
  String? name;
  String? email;
  bool existeTokenYDatos = true;
  @override
  void initState() {
    getToken();
    super.initState();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    name = prefs.getString('name');
    email = prefs.getString('email');

    existeTokenYDatos = token != null && name != null && email != null;

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const GradientText(
              text: 'Hola',
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 14, 62, 144),
                Color.fromARGB(119, 20, 57, 157)
              ])),
          Center(
              child: LottieBuilder.asset(
            'assets/images/load-3.json',
            width: double.infinity,
          ))
        ],
      ),
      duration: 2030,
      nextScreen:
          existeTokenYDatos ? const InitialPage() : const PrincipalPage(),
      splashIconSize: 250,
      backgroundColor: const Color(0x0015172b),
    );
  }
}
