import 'package:docdoc/features/messages/data/models/message_item_model.dart';
import 'package:flutter/material.dart';

class ConversationViewBody extends StatelessWidget {
  const ConversationViewBody({super.key, required this.messageItemModel});
  final MessageItemModel messageItemModel;
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.all(16.0),
        child: Column(),
      ),
    );
  }
}
