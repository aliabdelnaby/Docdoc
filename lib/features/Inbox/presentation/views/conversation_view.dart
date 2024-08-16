import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../../data/models/message_item_model.dart';
import '../widgets/conversation_view_body.dart';
import '../widgets/custom_type_msg_nav_bar.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    final MessageItemModel messageItemModel =
        extra?['message'] ?? 'Unknown Details';
    return Scaffold(
      backgroundColor: AppColors.chatBackground,
      appBar: buildAppBar(
        context,
        title: messageItemModel.name,
        trailing: Container(
          constraints: const BoxConstraints(minHeight: 40, minWidth: 40),
          margin: const EdgeInsetsDirectional.only(
            start: 16,
            top: 5,
            bottom: 5,
            end: 16,
          ),
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
            Assets.imagesVideoCallAppointment,
            colorFilter: const ColorFilter.mode(
              AppColors.black2,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomTypeMessage(),
      resizeToAvoidBottomInset: false,
      body: ConversationViewBody(
        messageItemModel: messageItemModel,
      ),
    );
  }
}
