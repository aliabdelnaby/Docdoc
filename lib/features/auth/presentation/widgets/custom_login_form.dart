import 'package:docdoc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:docdoc/features/auth/presentation/cubit/auth_state.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:docdoc/features/auth/presentation/widgets/remember_me_and_forgot_password.dart';
import 'package:docdoc/features/onBorading/presentation/widgets/auth_brn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginForm extends StatelessWidget {
  const CustomLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: cubit.loginFormKey,
          child: Column(
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
              const RememberMeAndForgotPassword(),
              const SizedBox(height: 32),
              CustomAuthBtn(
                onPressed: () {
                  if (cubit.loginFormKey.currentState!.validate()) {}
                },
                text: 'Login',
              ),
            ],
          ),
        );
      },
    );
  }
}
