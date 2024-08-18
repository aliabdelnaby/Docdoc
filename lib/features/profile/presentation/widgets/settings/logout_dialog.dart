import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../cubit/profile_cubit.dart';
import '../../cubit/profile_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loggedout Successfuly'),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.go('/login');
        } else if (state is LogoutFailureState) {
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
        return state is LogoutLoadingState
            ? const CupertinoActivityIndicator(
                color: AppColors.primary,
              )
            : CupertinoAlertDialog(
                title: Text(
                  'Logout',
                  style: AppStyles.style16W600.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                content: Text(
                  'You’ll need to enter your email\nand password next time\nyou want to login',
                  style: AppStyles.style12W400.copyWith(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  CupertinoDialogAction(
                    child: Text(
                      'Cancel',
                      style: AppStyles.style14W400.copyWith(
                        color: const Color(0xff007AFF),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text(
                      'Log Out',
                      style: AppStyles.style14W400.copyWith(
                        color: const Color(0xffFF0000),
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      context.read<ProfileCubit>().logout();
                    },
                  ),
                ],
              );
      },
    );
  }
}
