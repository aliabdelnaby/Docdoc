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
            padding: EdgeInsetsDirectional.only(
              top: 50,
              bottom: 20,
              start: 24,
              end: 24,
            ),
            child: Column(
              children: [
                LoginHeaderText(),
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
