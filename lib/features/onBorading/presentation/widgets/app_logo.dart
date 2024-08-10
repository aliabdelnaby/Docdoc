import '../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Center(
        child: Image.asset(
          Assets.imagesDocLogo,
        ),
      ),
    );
  }
}
