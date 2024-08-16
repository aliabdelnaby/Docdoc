import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/messages/presentation/widgets/create_new_message_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateNewMessageBtn extends StatelessWidget {
  const CreateNewMessageBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: AppColors.white,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
          ),
          builder: (context) {
            return const CreateNewMessageBody();
          },
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        margin: const EdgeInsetsDirectional.only(
            start: 16, top: 5, bottom: 5, end: 16),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: AppColors.white,
          border: Border.all(
            color: AppColors.textFieldBorder,
            width: 1,
          ),
        ),
        child: SvgPicture.asset(
          Assets.imagesMessageAdd,
        ),
      ),
    );
  }
}
