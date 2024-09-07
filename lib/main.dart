import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/pages/aa.dart';
import 'package:proyecto_sw1/src/pages/login_page.dart';
import 'package:proyecto_sw1/src/pages/plan1.dart';
import 'package:proyecto_sw1/src/pages/plan2.dart';
import 'package:proyecto_sw1/src/pages/plan3.dart';
import 'package:proyecto_sw1/src/pages/plan4.dart';
import 'package:proyecto_sw1/src/pages/principal.dart';
import 'package:proyecto_sw1/src/pages/splash.dart';
import 'package:proyecto_sw1/src/pages/vista_inicial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      initialRoute: 'login',
      routes: {
        'vista-inicial': (BuildContext context) => const VistaInicial(),
        'splash': (BuildContext context) => const Splash(),
        'aa': (BuildContext context) => const Aa(),
        'login': (BuildContext context) => const LoginPage(),
        'principal': (BuildContext context) => Principal(),
        'plan1': (BuildContext context) => const Plan1(),
        'plan2': (BuildContext context) => const Plan2(),
        'plan3': (BuildContext context) => const Plan3(),
        'plan4': (BuildContext context) => const Plan4(),
      },
    );
  }
}
