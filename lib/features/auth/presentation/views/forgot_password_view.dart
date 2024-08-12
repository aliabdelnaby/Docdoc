import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../onBorading/presentation/widgets/auth_brn.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_auth_text_field.dart';
import '../widgets/login/login_header_text_section.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 50, bottom: 26, start: 16, end: 16),
          child: Form(
            key: cubit.forgotPasswordFormKey,
            child: Column(
              children: [
                const CustomAuthHeaderTextSection(
                  title: 'Forgot Password',
                  subTitle:
                      'At our app, we take the security of your information seriously.',
                ),
                const SizedBox(height: 32),
                CustomAuthTextField(
                  hintText: 'Email or Phone Number',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    return null;
                  },
                  onChanged: (emailOrPhone) {
                    cubit.phone = emailOrPhone;
                    cubit.email = emailOrPhone;
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                  child: CustomAuthBtn(
                    onPressed: () {
                      if (cubit.forgotPasswordFormKey.currentState!
                          .validate()) {}
                    },
                    text: "Reset Password",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
