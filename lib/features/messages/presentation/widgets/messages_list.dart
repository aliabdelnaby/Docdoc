import 'package:go_router/go_router.dart';

import '../../data/models/message_item_model.dart';
import 'message_item.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({
    super.key,
    required this.filteredMessages,
  });

  final List<MessageItemModel> filteredMessages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          filteredMessages.length,
          (index) {
            var fMessages = filteredMessages[index];
            return GestureDetector(
              onTap: () {
                context.push(
                  '/conversationView',
                  extra: {
                    'message': fMessages,
                  },
                );
              },
              child: MessageItem(
                filteredMessages: fMessages,
              ),
            );
          },
        ),
      ),
    );
  }
}
