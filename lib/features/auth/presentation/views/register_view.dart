import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/custom_register_form_section.dart';
import '../widgets/login/login_header_text_section.dart';
import '../widgets/login/login_options_section.dart';
import '../widgets/login/terms_and_dont_have_account_section.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                  title: 'Create Account',
                  subTitle:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                ),
                const SizedBox(height: 36),
                const CustomRegisterFormSection(),
                const SizedBox(height: 46),
                const CustomLoginOptionsSection(),
                const SizedBox(height: 32),
                CustomTermsAndDontHaveAccountSection(
                  onTap: () {
                    context.pushReplacement('/login');
                  },
                  text1: 'Already have an account? ',
                  text2: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
