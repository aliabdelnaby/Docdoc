import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/onBorading/presentation/widgets/auth_brn.dart';
import 'package:flutter/material.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Personal information"),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 32),
                  Image.asset(
                    Assets.imagesProfileAvatar,
                    height: 150,
                  ),
                  const SizedBox(height: 50),
                  CustomAuthTextField(
                    hintText: "Name",
                    keyboardType: TextInputType.name,
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (name) {},
                  ),
                  CustomAuthTextField(
                    hintText: "Emial",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) {},
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
                  ),
                  CustomAuthTextField(
                    hintText: "Phone",
                    keyboardType: TextInputType.number,
                    onChanged: (phone) {},
                    validator: (phone) {
                      if (phone == null || phone.isEmpty) {
                        return 'Please enter your phone';
                      }
                      return null;
                    },
                  ),
                  CustomAuthTextField(
                      hintText: "Password",
                      obscureText: true,
                      onChanged: (password) {},
                      validator: (confirmPassword) {
                        if (confirmPassword == null ||
                            confirmPassword.isEmpty) {
                          return 'Please enter your confirm password';
                        }
                        // else if (cubit.password != confirmPassword) {
                        //   return 'Passwords do not match';
                        // }
                        return null;
                      }),
                  CustomAuthTextField(
                    hintText: "Confirm Password",
                    obscureText: true,
                    onChanged: (password) {},
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "When you set up your personal information settings, you should take care to provide accurate information.",
                    style: AppStyles.style12W400.copyWith(
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
              child: CustomAuthBtn(
                onPressed: () {},
                text: "Save",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
