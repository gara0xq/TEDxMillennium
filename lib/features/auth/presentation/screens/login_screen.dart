import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/custom_button.dart';
import '../widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 60,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', width: 200),
            Container(
              width: 450,
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 40,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      spacing: 20,
                      children: [
                        InputField(controller: emailController),
                        InputField(
                          controller: passwordController,
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),

                  CustomButton(text: 'Sign In', align: Alignment.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
