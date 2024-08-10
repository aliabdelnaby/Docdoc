import 'dont_have_account.dart';
import 'terms_and_condidtion_widget.dart';
import 'package:flutter/material.dart';

class CustomTermsAndDontHaveAccountSection extends StatelessWidget {
  const CustomTermsAndDontHaveAccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TermsAndConditionsTextWidget(),
        SizedBox(height: 24),
        DontHaveAccount(),
      ],
    );
  }
}