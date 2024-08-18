import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../../../onBorading/presentation/widgets/auth_brn.dart';
import '../widgets/settings/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Payment",
        trailing: Container(
          constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
          margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5, end: 16),
          padding: const EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.textFieldBorder,
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesScanner,
            colorFilter: const ColorFilter.mode(
              AppColors.black2,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: const PaymentViewBody(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: CustomAuthBtn(
          onPressed: () {},
          text: "Add New",
        ),
      ),
    );
  }
}
