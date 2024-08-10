import 'package:docdoc/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthTextField(
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'Please enter your email';
            } else if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
            ).hasMatch(p0)) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onChanged: (p0) {},
        ),
        CustomAuthTextField(
          hintText: 'Password',
          validator: (p0) {
            if (p0 == null || p0.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
          onChanged: (p0) {},
        ),
      ],
    );
  }
}
