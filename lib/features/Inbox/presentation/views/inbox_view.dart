import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../widgets/create_new_message_btn.dart';
import '../widgets/messages_view_body.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

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
