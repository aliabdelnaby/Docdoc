import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:docdoc/features/messages/presentation/widgets/create_new_message_btn.dart';
import 'package:docdoc/features/messages/presentation/widgets/messages_view_body.dart';
import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Messages',
        trailing: const CreateNewMessageBtn(),
      ),
      body: const MessagesViewBody(),
    );
  }
}
