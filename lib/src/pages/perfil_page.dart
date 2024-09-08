import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/models/user.dart';
import 'package:proyecto_sw1/src/pages/dashboard_page.dart';
import 'package:proyecto_sw1/src/services/providers/user_provider.dart';

class PerfilPage extends ConsumerStatefulWidget {
  const PerfilPage({super.key});

  @override
  PerfilPageState createState() => PerfilPageState();
}

class PerfilPageState extends ConsumerState<PerfilPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final User user = ref.watch(userProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(1, 21, 23, 43),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 90),
          child: Column(
            children: [_datosUser(user), _caja(), _botones()],
          ),
        ),
      ),
    );
  }

  Widget _botones() {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_botonInicio(), _botonSalir()],
      ),
    );
  }

  TextButton _botonSalir() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 25.0),
        ),
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(255, 21, 23, 43)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text(
        'Salir',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  TextButton _botonInicio() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const DashboardPage()));
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        ),
        backgroundColor:
            WidgetStateProperty.all(const Color.fromARGB(255, 21, 23, 43)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: const Text(
        'Inicio',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    );
  }

  Container _caja() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 50),
      height: 400,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 21, 23, 43),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Row _datosUser(User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [_imagenPerfil(user), _nombreCorreo(user)],
    );
  }

  Column _nombreCorreo(User user) {
    return Column(
      children: [
        Text(
          user.displayName == null ? 'no name' : user.displayName.toString(),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        Text(user.email == null ? 'no name' : user.email.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 14))
      ],
    );
  }

  Container _imagenPerfil(User user) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color.fromARGB(255, 40, 37, 60),
          width: 3.0,
        ),
      ),
      child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 45,
          child: ClipOval(
              child: (user.images != null && user.images!.isNotEmpty)
                  ? Image.network(
                      user.images![0].url,
                      fit: BoxFit.cover,
                      height: 90,
                      width: 90,
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                    ))),
    );
  }
}
