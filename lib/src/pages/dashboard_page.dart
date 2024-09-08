import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/pages/perfil_page.dart';
import 'package:proyecto_sw1/src/services/providers/user_provider.dart';
import 'package:proyecto_sw1/src/services/user/user_profile.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends ConsumerState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    getUserProfile(ref);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PerfilPage()));
                },
                icon: const Icon(Icons.person))
          ],
        ),
        body: Column(
          children: [
            Center(
                child: Image.network((user.images != null &&
                        user.images!.isNotEmpty)
                    ? user.images![0].url
                    : 'https://cdn-icons-png.flaticon.com/512/1144/1144760.png'))
          ],
        ));
  }
}
