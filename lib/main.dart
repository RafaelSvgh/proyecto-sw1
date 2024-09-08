import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/pages/aa.dart';
import 'package:proyecto_sw1/src/pages/initial_page.dart';
import 'package:proyecto_sw1/src/pages/perfil_page.dart';
import 'package:proyecto_sw1/src/pages/splash_page.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        'vista-inicial': (BuildContext context) => const InitialPage(),
        'splash': (BuildContext context) => const Splash(),
        'login': (BuildContext context) => const SpotifyAuthScreen(),
        'perfil': (BuildContext context) => const PerfilPage(),
        
      },
    );
  }
}
