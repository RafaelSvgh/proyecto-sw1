import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_sw1/src/models/user.dart';

final userProvider = StateProvider<User>((ref) {
  return User();
});
