import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/pages/login_page.dart';
import 'package:proyecto_sw1/src/services/auth/auth_service.dart';
import 'package:proyecto_sw1/src/widgets/loginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _isLoading = false;
  String? _errorMessage;
  SharedPreferences? _prefs;
  final AuthService _authService = AuthService();
  @override
  void initState() {
    cargarPrefs();
    super.initState();
  }

  cargarPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/fondo.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _titulo(),
                  _formulario(),
                  const SizedBox(
                    height: 30,
                  ),
                  _botonIngreso(),
                  const Spacer(),
                  _textoInferior(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textoInferior() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Ya tienes una cuenta? ',
          style: TextStyle(
            color: Color.fromARGB(255, 225, 225, 225),
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ));
          },
          child: const Text(
            'Inicia Sesión',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Widget _botonIngreso() {
    return _isLoading
        ? const CircularProgressIndicator()
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(153, 66, 66, 66),
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 32.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              final isValid = _formKey.currentState!.validate();
              if (!isValid) return;
              _registro();
            },
            child: const Text(
              "Ingresar",
              style: TextStyle(
                color: Color.fromARGB(255, 225, 225, 225),
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }

  Form _formulario() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _campoNombre(),
            const SizedBox(
              height: 25.0,
            ),
            _campoCorreo(),
            const SizedBox(
              height: 25.0,
            ),
            _campoPassword(),
          ],
        ));
  }

  LoginForm _campoPassword() {
    return LoginForm(
      label: 'Contraseña',
      hint: 'contraseña',
      icon: Icons.lock_person,
      password: true,
      onChanged: (value) => password = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese una contraseña';
        }
        if (value.length < 6) {
          return 'Mínimo 6 caracteres';
        }
        return null;
      },
    );
  }

  LoginForm _campoNombre() {
    return LoginForm(
      label: 'Nombre',
      hint: 'nombre',
      icon: Icons.person,
      password: false,
      onChanged: (value) => name = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese un nombre';
        }
        if (value.length < 4) {
          return 'Mínimo 4 caracteres';
        }
        return null;
      },
    );
  }

  LoginForm _campoCorreo() {
    return LoginForm(
      label: 'Correo Electrónico',
      hint: 'correo',
      icon: Icons.alternate_email,
      onChanged: (value) => email = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Ingrese un correo';
        }
        final emailRegExp = RegExp(
          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
        );
        if (!emailRegExp.hasMatch(value)) {
          return 'Formato de correo no válido';
        }
        return null;
      },
    );
  }

  Widget _titulo() {
    return Container(
      height: 330,
      padding: const EdgeInsets.only(bottom: 30),
      alignment: Alignment.bottomCenter,
      child: const Text(
        "Registro",
        style: TextStyle(
            color: Color.fromARGB(255, 225, 225, 225),
            fontSize: 29,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Future<void> _registro() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await _authService.register(name: name, email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Registro exitoso')));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Error de registro.';
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(_errorMessage!)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
