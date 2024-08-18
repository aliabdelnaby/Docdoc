import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.style14W500.copyWith(
          color: AppColors.black2,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppStyles.style10W400.copyWith(
          color: AppColors.black2,
        ),
      ),
      leading: SvgPicture.asset(
        image,
      ),
      trailing: Text(
        "Connected",
        style: AppStyles.style14W400.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
