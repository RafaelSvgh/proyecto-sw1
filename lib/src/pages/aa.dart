import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proyecto_sw1/src/services/auth/auth_spotify.dart';
import 'package:proyecto_sw1/src/services/auth/get_access_token.dart';
import 'package:uni_links/uni_links.dart';

class SpotifyAuthScreen extends StatefulWidget {
  const SpotifyAuthScreen({super.key});

  @override
  State<SpotifyAuthScreen> createState() => _SpotifyAuthScreenState();
}

class _SpotifyAuthScreenState extends State<SpotifyAuthScreen> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _listenToRedirects();
  }

  void _listenToRedirects() {
    // ignore: deprecated_member_use
    _sub = getUriLinksStream().listen((Uri? uri) {
      if (uri != null && uri.toString().startsWith('myapp://callback')) {
        final String? code = uri.queryParameters['code'];
        if (code != null) {
          getAccessToken(code, context);
        }
      }
    }, onError: (err) {});
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spotify Authentication')),
      body: const Center(
        child: ElevatedButton(
          onPressed: authenticateWithSpotify,
          child: Text('Iniciar sesión con Spotify'),
        ),
      ),
    );
  }

}

class HomeScreen extends StatelessWidget {
  final String accessToken;

  const HomeScreen({super.key, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Text('Access Token: $accessToken'),
      ),
    );
  }
}
