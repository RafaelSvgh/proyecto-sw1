import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_sw1/src/pages/plan1.dart';
import 'package:proyecto_sw1/src/pages/plan2.dart';
import 'package:proyecto_sw1/src/pages/plan3.dart';
import 'package:proyecto_sw1/src/pages/plan4.dart';

class Principal extends StatelessWidget {

  // Mover la lista fuera del método build, dentro de la clase
  final List<String> imagePaths = [
    'assets/images/plan1.jpg', // Imagen 1
    'assets/images/plan2.jpg', // Imagen 2
    'assets/images/plan3.jpg', // Imagen 3
    'assets/images/plan4.jpg', // Imagen 4
  ];

  Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF15172B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF15172B),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight, // Posición del botón
              child: IconButton(
                onPressed: () {
                  // Acción del botón            
                },
                icon: const Icon(Icons.person),
                iconSize: 45, // Tamaño del ícono
                color: Colors.green, // Color del ícono
              ),
            ),  

            const SizedBox(height: 10),

            _swiper(),

            const SizedBox(height: 45),

            Container(
              width: 350,
              height: 450,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 29, 29, 29), // Color de fondo
                borderRadius: BorderRadius.circular(20), // Bordes redondeados (opcional)
              ),

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: const Alignment(-0.9, 1),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 127, 0, 185),// Color de fondo                              
                          borderRadius: BorderRadius.circular(8), // Bordes redondeados (opcional)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3), // Espaciado interno
                        
                        child: const Text(
                          'HISTORIAL',
                          style: TextStyle(
                            color: Colors.white,// Color del texto
                            fontSize: 12, // Tamaño de la fuente
                            fontWeight: FontWeight.bold, // Negrita
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  _label(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(){
    return Column(
    children: [
      Center(
        child: Container(
          width: 330, // Ancho del contenedor ajustado
          decoration: BoxDecoration(
            color: const Color(0xFF15172B), // Color de fondo                              
            borderRadius: BorderRadius.circular(8), // Bordes redondeados (opcional)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8), // Reducir el padding horizontal
          alignment: Alignment.centerLeft, // Alinea el texto a la izquierda dentro del Container
          child: const Text(
            'ID Sala',
            style: TextStyle(
              color: Colors.white, // Color del texto
              fontSize: 12, // Tamaño de la fuente
              fontWeight: FontWeight.bold, // Negrita
            ),
          ),
        ),
      ),
    ],
  );
  }

  Widget _swiper(){
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Navegar a otra vista cuando se toca la imagen   
              switch (index) {
                case 0:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const Plan1();
                  }));
                  break;
                case 1:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const Plan2();
                  }));
                  break;
                case 2:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const Plan3();
                  }));
                  break;
                case 3:
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const Plan4();
                  }));
                  break;
              }         
            },
            child: Stack(
              fit: StackFit.expand, // Asegura que el Stack ocupe todo el espacio
              children: [
                // Imagen que actúa como fondo y botón
                Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover, // Ajusta la imagen sin distorsionarla
                ),
                
                Center(
                  child: Text(
                    'Plantilla ${index + 1}', // Texto dinámico según la imagen
                    style: const TextStyle(
                      color: Colors.white, // Color del texto
                      fontSize: 18, // Tamaño del texto
                      fontWeight: FontWeight.bold, // Negrita
                    ),
                  ),
                ),
              ]
            ),
          );
        },
        itemCount: 4,
        //pagination: const SwiperPagination(),
        //control: const SwiperControl(),
      ),
    );
  }
}