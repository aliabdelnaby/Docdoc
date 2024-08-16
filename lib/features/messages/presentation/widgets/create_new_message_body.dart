import 'package:docdoc/features/messages/presentation/widgets/create_new_msg_app_bar.dart';
import 'package:flutter/material.dart';

class CreateNewMessageBody extends StatelessWidget {
  const CreateNewMessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(17),
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: const Column(
        children: [
          CreateNewMsgAppBar(),
        ],
      ),
    );
  }
}
