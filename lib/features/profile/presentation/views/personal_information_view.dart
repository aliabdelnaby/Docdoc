import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/auth/presentation/widgets/custom_auth_text_field.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/onBorading/presentation/widgets/auth_brn.dart';
import 'package:docdoc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:docdoc/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({super.key});

  @override
  State<PersonalInformationView> createState() =>
      _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Personal information"),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is GetProfileSuccessState) {
              var profile = context.read<ProfileCubit>().profileModel;
              nameController.text = profile!.name ?? '';
              emailController.text = profile.email ?? '';
              phoneController.text = profile.phone ?? '';
            }
          },
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            return Form(
              key: cubit.updateProfileKey,
              child: Column(
                children: [
                  Expanded(
                    child: state is GetProfileLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          )
                        : ListView(
                            children: [
                              const SizedBox(height: 32),
                              Image.asset(
                                Assets.imagesProfileAvatar,
                                height: 150,
                              ),
                              const SizedBox(height: 50),
                              CustomAuthTextField(
                                controller: nameController,
                                hintText: "Name",
                                keyboardType: TextInputType.name,
                                onChanged: (name) {
                                  cubit.name = name;
                                },
                                validator: (name) {
                                  if (name == null || name.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              CustomAuthTextField(
                                controller: emailController,
                                hintText: "Email",
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (email) {
                                  cubit.email = email;
                                },
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
                                controller: phoneController,
                                hintText: "Phone",
                                keyboardType: TextInputType.number,
                                onChanged: (phone) {
                                  cubit.phone = phone;
                                },
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
                                onChanged: (password) {
                                  cubit.password = password;
                                },
                                validator: (password) {
                                  if (password == null || password.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              CustomAuthTextField(
                                hintText: "Confirm Password",
                                obscureText: true,
                                onChanged: (confirmPassword) {
                                  cubit.confirmPassword = confirmPassword;
                                },
                                validator: (confirmPassword) {
                                  if (confirmPassword == null ||
                                      confirmPassword.isEmpty) {
                                    return 'Please enter your password';
                                  } else if (cubit.password !=
                                      confirmPassword) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                              ),
                              Text(
                                "When you set up your personal information settings, you should take care to provide accurate information.",
                                style: AppStyles.style12W400.copyWith(
                                  color: AppColors.textGrey,
                                ),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                  ),
                  BlocConsumer<ProfileCubit, ProfileState>(
                    listener: (context, state) {
                      if (state is UpdateProfileSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Profile Updated Successfuly'),
                            backgroundColor: AppColors.primary,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                        context.pop();
                      } else if (state is UpdateProfileFailureState) {
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
                      return state is UpdateProfileLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 8),
                              child: CustomAuthBtn(
                                onPressed: () async {
                                  if (cubit.updateProfileKey.currentState!
                                      .validate()) {
                                    await cubit.updateProfile();
                                  }
                                },
                                text: "Save",
                              ),
                            );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
