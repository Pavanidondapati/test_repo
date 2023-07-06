import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

class AuthService {
  bool isLoggedIn = false;
  Future<bool> login(String email, String Password) async {
    await Future.delayed(const Duration(seconds: 3), () {
      isLoggedIn = true;
    });
    return isLoggedIn;
  }
}
