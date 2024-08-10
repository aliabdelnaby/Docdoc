import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginOptionItem extends StatelessWidget {
  const LoginOptionItem({super.key, required this.image, this.onTap});

  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 46,
          minWidth: 46,
        ),
        padding: const EdgeInsetsDirectional.all(11),
        decoration: BoxDecoration(
          color: AppColors.loginOptions,
          borderRadius: BorderRadius.circular(100),
        ),
        child: SvgPicture.asset(
          image,
        ),
      ),
    );
  }
}
