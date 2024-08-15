import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../onBorading/presentation/widgets/auth_brn.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../custom_auth_text_field.dart';
import 'remember_me_and_forgot_password.dart';

class CustomLoginFormSection extends StatelessWidget {
  const CustomLoginFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushReplacement('/mainView');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: AppColors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.loginFormKey,
          child: Column(
            children: [
              CustomAuthTextField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                  ).hasMatch(email)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (email) {
                  cubit.email = email;
                },
              ),
              CustomAuthTextField(
                hintText: 'Password',
                validator: (password) {
                  if (password == null || password.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onChanged: (password) {
                  cubit.password = password;
                },
                suffixIcon: IconButton(
                  color: AppColors.primary,
                  icon: Icon(
                    cubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    cubit.obscurePasswordText();
                  },
                ),
                obscureText: cubit.obscurePasswordTextValue,
              ),
              const RememberMeAndForgotPassword(),
              const SizedBox(height: 32),
              state is LoginLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : CustomAuthBtn(
                      onPressed: () async {
                        if (cubit.loginFormKey.currentState!.validate()) {
                          await cubit.login();
                        }
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
