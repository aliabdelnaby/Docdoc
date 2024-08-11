import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';
import '../widgets/doctor_image_and_text.dart';
import '../widgets/sub_title_text_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(top: 22, bottom: 32),
            child: Column(
              children: [
                AppLogo(),
                SizedBox(height: 40),
                DoctorImageAndText(),
                SubTitleTextAndBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
