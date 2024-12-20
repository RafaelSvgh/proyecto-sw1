import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/models/user.dart';
import 'package:proyecto_sw1/src/pages/principal_page.dart';
import 'package:proyecto_sw1/src/pages/register_page.dart';
import 'package:proyecto_sw1/src/services/auth/auth_service.dart';
import 'package:proyecto_sw1/src/services/providers/user_provider.dart';
import 'package:proyecto_sw1/src/widgets/loginForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ConsumerState<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
          '¿No tienes una cuenta? ',
          style: TextStyle(
            color: Color.fromARGB(255, 225, 225, 225),
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ));
          },
          child: const Text(
            'Regístrate',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
              _login();
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
        "Login",
        style: TextStyle(
            color: Color.fromARGB(255, 225, 225, 225),
            fontSize: 29,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final response =
          await _authService.login(email: email, password: password);
      if (response.containsKey('token')) {
        String token = response['token'];
        String email = response['email'];
        String name = response['name'];
        _prefs!.setString('token', token);
        _prefs!.setString('email', email);
        _prefs!.setString('name', name);
        User user = User.fromJson(response);
        ref.read(userProvider.notifier).update((state) => user);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PrincipalPage()),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error de autenticación. Verifica tus credenciales.';
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
