import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();

  final String _baseUrl = 'http://10.0.2.2:3000/api/auth';

  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error durante el login');
    }
  }

  Future<Map<String, dynamic>> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/register',
        data: {
          'name':name,
          'email': email,
          'password': password,
        },
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception('Error en la solicitud: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error durante el login');
    }
  }
}
