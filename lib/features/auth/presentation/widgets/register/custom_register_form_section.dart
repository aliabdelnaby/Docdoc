import 'package:docdoc/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:docdoc/features/onBorading/presentation/widgets/auth_brn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomRegisterFormSection extends StatelessWidget {
  const CustomRegisterFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.registerFormKey,
      child: Column(
        children: [
          CustomAuthTextField(
            hintText: 'name',
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
          ),
          const SizedBox(height: 16),
          CustomAuthBtn(
            onPressed: () {
              if (cubit.registerFormKey.currentState!.validate()) {}
            },
            text: "Create Account",
          ),
        ],
      ),
    );
  }
}
