import 'package:flutter/material.dart';

class Plan2 extends StatelessWidget {
  const Plan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Hace que la imagen se extienda detrás del AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0, // Elimina la sombra del AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          iconSize: 30,
          onPressed: () {
            // Vuelve a la pantalla principal cuando se toca la flecha
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plan2.jpg'),
                fit: BoxFit.cover, // Hace que la imagen cubra todo el espacio
              ),
            ),
          ),
        ]
      ),
    );
  }
}