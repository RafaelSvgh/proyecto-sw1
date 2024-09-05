import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:proyecto_sw1/src/pages/vista_inicial.dart';
import 'package:proyecto_sw1/src/widgets/texto_gradiente.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
      nextScreen: const VistaInicial(),
      splashIconSize: 250,
      backgroundColor: const Color(0x0015172b),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
