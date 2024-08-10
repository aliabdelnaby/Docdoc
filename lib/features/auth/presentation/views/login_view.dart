import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/login/custom_login_form_section.dart';
import '../widgets/login/login_header_text_section.dart';
import '../widgets/login/login_options_section.dart';
import '../widgets/login/terms_and_dont_have_account_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 24, end: 24, top: 50, bottom: 20),
            child: Column(
              children: [
                const CustomAuthHeaderTextSection(
                  title: 'Welcome Back',
                  subTitle:
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                ),
                const SizedBox(height: 36),
                const CustomLoginFormSection(),
                const SizedBox(height: 46),
                const CustomLoginOptionsSection(),
                const SizedBox(height: 32),
                CustomTermsAndDontHaveAccountSection(
                  onTap: () {
                    context.pushReplacement('/register');
                  },
                  text1: 'Don\'t have an account? ',
                  text2: 'Sign up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
