import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentInformationListTile extends StatelessWidget {
  const PaymentInformationListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.btnText,
    required this.image,
    required this.backgroundColor,
  });
  final String title;
  final String subtitle;
  final String btnText;
  final String image;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      title: Text(
        title,
        style: AppStyles.style14W500.copyWith(
          color: AppColors.black2,
        ),
      ),
      subtitle: Text(
        subtitle,
      ),
      leading: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: SvgPicture.asset(
          image,
        ),
      ),
      trailing: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(46),
              side: const BorderSide(
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        child: Text(
          btnText,
          style: AppStyles.style12W400.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
