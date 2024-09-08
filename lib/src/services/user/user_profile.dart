import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto_sw1/src/models/user.dart';
import 'package:proyecto_sw1/src/services/providers/user_provider.dart';

Future<void> getUserProfile(WidgetRef ref) async {
  const storage = FlutterSecureStorage();
  final String? token = await storage.read(key: 'spotify_token');
  final User user;
  if (token != null) {
    final response = await http.get(
      Uri.parse('https://api.spotify.com/v1/me'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      // Procesa la respuesta de la API
      // final Map<String, dynamic> json = jsonDecode(response.body);
      user = User.fromJson(jsonDecode(response.body));
      ref.read(userProvider.notifier).update((state) => user);
    } else {
      throw 'Error al obtener el perfil de usuario: ${response.body}';
    }
  } else {
    throw 'No se encontró el token de acceso';
  }
}
