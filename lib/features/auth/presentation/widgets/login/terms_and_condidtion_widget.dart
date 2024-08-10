import '../../../../../core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsTextWidget extends StatelessWidget {
  const TermsAndConditionsTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By logging, you agree to our ',
        style: AppStyles.style11W400.copyWith(fontSize: 13),
        children: [
          TextSpan(
            text: 'Terms & Conditions ',
            style: AppStyles.style11W500.copyWith(fontSize: 13),
          ),
          TextSpan(
            text: 'and ',
            style: AppStyles.style11W400.copyWith(fontSize: 13),
          ),
          TextSpan(
            text: 'Privacy Policy.',
            style: AppStyles.style11W500.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
