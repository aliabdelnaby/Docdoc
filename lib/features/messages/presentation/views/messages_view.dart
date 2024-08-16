import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/messages/presentation/widgets/messages_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Messages',
        trailing: Container(
          constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
          margin: const EdgeInsetsDirectional.only(
              start: 16, top: 5, bottom: 5, end: 16),
          padding: const EdgeInsetsDirectional.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: AppColors.white,
            border: Border.all(
              color: AppColors.textFieldBorder,
              width: 1,
            ),
          ),
          child: SvgPicture.asset(
            Assets.imagesMessageAdd,
          ),
        ),
      ),
      body: const MessagesViewBody(),
    );
  }
}
