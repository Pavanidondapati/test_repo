import 'package:flutter/material.dart';

TextFormField customTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    final passwordRegex = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{6,}$');

    if (!passwordRegex.hasMatch(value)) {
      return 'Use 6 or more characters with a mix of letters, numbers & symbols.';
    }
    return null;
  }

  return TextFormField(
    textAlignVertical: TextAlignVertical.center,
    controller: controller,
    validator: isPasswordType ? _validatePassword : _validateEmail,
    obscureText: isPasswordType,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        fillColor: Colors.white,
        focusColor: Colors.white,
        prefix: Icon(icon),
        labelText: text,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIconColor: Colors.white),
  );
}
