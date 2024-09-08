import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_sw1/src/pages/dashboard_page.dart';
import 'package:proyecto_sw1/src/pages/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:proyecto_sw1/src/pages/perfil_page.dart';

Future<void> getAccessToken(String code, BuildContext context) async {
  const String clientId = '1d29336f6a00486e9c0d5ac46ba67c78';
  const String clientSecret = 'cce20ea8fc764f23b8fb50ba648e9e68';
  const String redirectUri = 'myapp://callback';
  const storage = FlutterSecureStorage();

  final response = await http.post(
    Uri.parse('https://accounts.spotify.com/api/token'),
    headers: {
      'Authorization':
          'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: {
      'grant_type': 'authorization_code',
      'code': code,
      'redirect_uri': redirectUri,
    },
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> json = jsonDecode(response.body);
    final String accessToken = json['access_token'];
    await storage.write(key: 'spotify_token', value: accessToken);
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (context) => const DashboardPage()),
    );
  } else {
    throw 'Failed to get access token: ${response.body}';
  }
}
