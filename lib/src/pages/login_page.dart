import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/pages/principal.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            const SizedBox(
              height: 20,
            ),
        
            _title(),
            _imagenSp(),
            const SizedBox(height: 50), // Espacio entre imagen y campos de texto
            
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0), // Margen a los costados
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Alineación del contenido en la parte izquierda
                children: [
                  const Text(
                    "Email or Username",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 10), // Espacio entre el texto y el campo de texto
                  
                  TextField(
                    decoration: _border().copyWith(
                      labelText: "Email or User",
                      prefixIcon: const Icon(Icons.email),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 122, 117, 117),
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 20), // Espacio entre los campos de texto
                  
                  const Text(
                    "Password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  
                  const SizedBox(height: 10), // Espacio entre el texto y el campo de texto
        
                  TextField(
                    decoration: _border().copyWith(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 122, 117, 117),
                      ),
        
                    ),
                    
                    //obscureText: true,
                  ),
        
                  const SizedBox(height: 60),
        
                  Center(
                    child: SizedBox(
                      width: 300, // Ancho del botón
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[850], // Color de fondo del botón
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Bordes redondeados
                            side: const BorderSide(
                              color: Colors.green, // Color del borde
                              width: 2, // Grosor del borde
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Navegar a otra vista
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                            return const Principal();
                          }));
                        },

                        child: const Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white, // Color del texto
                            fontWeight: FontWeight.w700,
                            fontSize: 23, // Tamaño de la fuente
                          ),
                          textAlign: TextAlign.center, // Centra el texto en el botón
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
            //const Spacer(),

            const SizedBox(height: 250),

            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Sing in",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 40),
        
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Login in to",
      style: TextStyle(
          color: Colors.white, 
          fontSize: 28, 
          fontWeight: FontWeight.w600
      ),
    );
  }

  Image _imagenSp(){
    return Image.asset(
      'assets/images/img-2.png',
      width: 240,
    );
  }

  InputDecoration _border() {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10), // Borde redondeado
      borderSide: const BorderSide(
        color: Colors.transparent, // Borde transparente
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.transparent, // Borde transparente cuando está enfocado
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.transparent, // Borde transparente cuando está habilitado
      ),
    ),
    filled: true, //fondo de relleno
    fillColor: const Color(0xFF1F222A),
  );
}

InputDecoration _loginBorder(){
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15), // Borde redondeado
      borderSide: const BorderSide(
        color: Colors.green, // Borde transparente
        width: 3,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.green, // Borde transparente cuando está enfocado
        width: 3,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.green, // Borde transparente cuando está habilitado
        width: 3,
      ),
    ),
    filled: true, //fondo de relleno
    fillColor: const Color(0xFF1F222A),
  );
}


}
