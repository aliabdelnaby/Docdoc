import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:docdoc/features/profile/presentation/cubit/profile_state.dart';
import 'package:docdoc/features/profile/presentation/widgets/profile/info_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileInfoSheet extends StatelessWidget {
  const CustomProfileInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is GetProfileLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              );
            } else if (state is GetProfileSuccessState) {
              final profile = context.read<ProfileCubit>().profileModel;
              return CustomInfoSheetBody(profile: profile);
            } else if (state is GetProfileFailureState) {
              return Center(child: Text(state.errMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
