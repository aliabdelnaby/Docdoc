import 'package:flutter/material.dart';

import '../widgets/login/custom_login_form_section.dart';
import '../widgets/login/login_header_text_section.dart';
import '../widgets/login/login_options_section.dart';
import '../widgets/login/terms_and_dont_have_account_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 24, end: 24, top: 50, bottom: 20),
            child: Column(
              children: [
                CustomAuthHeaderTextSection(
                  title: 'Welcome Back',
                  subTitle:
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                ),
                SizedBox(height: 36),
                CustomLoginFormSection(),
                SizedBox(height: 46),
                CustomLoginOptionsSection(),
                SizedBox(height: 32),
                CustomTermsAndDontHaveAccountSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
