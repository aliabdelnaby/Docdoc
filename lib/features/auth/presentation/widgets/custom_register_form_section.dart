import '../../../../core/utils/app_colors.dart';
import 'package:go_router/go_router.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'custom_auth_text_field.dart';
import '../../../onBorading/presentation/widgets/auth_brn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterFormSection extends StatelessWidget {
  const CustomRegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          context.pushReplacement('/login');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign Up Successful'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is SignUpFailureState) {
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
          key: cubit.registerFormKey,
          child: Column(
            children: [
              CustomAuthTextField(
                hintText: 'Name',
                keyboardType: TextInputType.name,
                validator: (name) {
                  if (name == null || name.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (name) {
                  cubit.name = name;
                },
              ),
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
                hintText: 'Your number',
                validator: (phone) {
                  if (phone == null || phone.isEmpty) {
                    return 'Please enter your number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                onChanged: (phone) {
                  cubit.phone = phone;
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
              CustomAuthTextField(
                hintText: 'Confirm Password',
                validator: (confirmPassword) {
                  if (confirmPassword == null || confirmPassword.isEmpty) {
                    return 'Please enter your confirm password';
                  } else if (cubit.password != confirmPassword) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onChanged: (confirmPassword) {
                  cubit.confirmPassword = confirmPassword;
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
              const SizedBox(height: 16),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primary,
                    )
                  : CustomAuthBtn(
                      onPressed: () async {
                        if (cubit.registerFormKey.currentState!.validate()) {
                          await cubit.register();
                        }
                      },
                      text: "Create Account",
                    ),
            ],
          ),
        );
      },
    );
  }
}
