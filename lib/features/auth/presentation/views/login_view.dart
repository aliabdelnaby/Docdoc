import 'package:docdoc/features/auth/presentation/widgets/custom_login_form.dart';
import 'package:docdoc/features/auth/presentation/widgets/login_header_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 50),
            child: Column(
              children: [
                LoginHeaderText(),
                SizedBox(height: 36),
                CustomLoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
