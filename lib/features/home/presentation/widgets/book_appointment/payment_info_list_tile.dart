import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentInformationListTile extends StatelessWidget {
  const PaymentInformationListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      title: Text(
        "Master Card",
        style: AppStyles.style14W500.copyWith(
          color: AppColors.black2,
        ),
      ),
      subtitle: const Text(
        '***** ***** ***** 37842',
      ),
      leading: Container(
        constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffF1F1F1),
        ),
        child: SvgPicture.asset(
          Assets.imagesMastercard,
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
          "Change",
          style: AppStyles.style12W400.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
