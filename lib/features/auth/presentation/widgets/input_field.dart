import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final bool isPassword;
  final TextEditingController controller;
  const InputField({
    super.key,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? true : false,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: isPassword ? '********' : 'email@example.com',
        hintStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        labelText: isPassword ? 'Password' : 'Email',
        labelStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        filled: true,
        fillColor: Colors.grey[900],
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[800]!),
        ),

        prefixIcon:
            isPassword
                ? const Icon(Icons.lock, color: Colors.grey, size: 20)
                : const Icon(Icons.email, color: Colors.grey, size: 20),
      ),
    );
  }
}
