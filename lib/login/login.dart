import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:posapp/dashboard/dashboard.dart';
import 'package:posapp/login/reuse_fieds.dart';
import 'package:posapp/notifier/auth_notifier.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField("Email", Icons.email, false, _email),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: customTextField(
                  "Password", Icons.remove_red_eye, true, _password),
            ),
            Consumer(builder: (context, ref, _) {
              bool isLoading = ref.watch(authNotifierProvider);
              return isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ref.read(authNotifierProvider.notifier).login(
                              email: _email.text,
                              password: _password.text,
                              context: context);
                        }
                      },
                      child: Text("Login"));
            }),
          ],
        ),
      )),
    );
  }
}
