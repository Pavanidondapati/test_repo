import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:posapp/service/auth_service.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
    (ref) => AuthNotifier(ref.watch(authServiceProvider)));

class AuthNotifier extends StateNotifier<bool> {
  final AuthService _authService;
  AuthNotifier(this._authService) : super(false);
  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      state = true;
      await _authService
          .login(email, password)
          .then((value) => {context.go("/dashboard")});
      state = false;
    } catch (e) {
      state = false;
    }
  }
}
