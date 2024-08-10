import '../../../../../core/utils/assets.dart';
import 'login_option_item.dart';
import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  const LoginOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginOptionItem(
          onTap: () {},
          image: Assets.imagesGoogle,
        ),
        const SizedBox(width: 32),
        LoginOptionItem(
          onTap: () {},
          image: Assets.imagesFacebook,
        ),
        const SizedBox(width: 32),
        LoginOptionItem(
          onTap: () {},
          image: Assets.imagesApple,
        ),
      ],
    );
  }
}
