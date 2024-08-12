import 'package:flutter/material.dart';

import 'dont_have_account.dart';
import 'terms_and_condidtion_widget.dart';

class CustomTermsAndDontHaveAccountSection extends StatelessWidget {
  const CustomTermsAndDontHaveAccountSection({
    super.key,
    this.onTap,
    required this.text1,
    required this.text2,
  });
  final void Function()? onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TermsAndConditionsTextWidget(),
        const SizedBox(height: 24),
        DontHaveAccount(
          onTap: onTap,
          text1: text1,
          text2: text2,
        ),
      ],
    );
  }
}
