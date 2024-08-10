import 'login_option.dart';
import 'or_sign_in_with.dart';
import 'package:flutter/material.dart';

class CustomLoginOptionsSection extends StatelessWidget {
  const CustomLoginOptionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OrSignInWithDivider(),
        SizedBox(height: 32),
        LoginOptions(),
      ],
    );
  }
}
