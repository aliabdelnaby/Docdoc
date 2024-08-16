import 'dart:async';
import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:docdoc/features/messages/data/datasource/messages_list.dart';
import 'package:docdoc/features/messages/data/models/message_item_model.dart';
import 'package:flutter/material.dart';

class MessagesViewBody extends StatefulWidget {
  const MessagesViewBody({super.key});

  @override
  State<MessagesViewBody> createState() => _MessagesViewBodyState();
}

class _MessagesViewBodyState extends State<MessagesViewBody> {
  List<MessageItemModel> filteredMessages = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    filteredMessages = messagesList;
  }

  void _filterMessages(String query) {
    setState(() {
      filteredMessages = messagesList
          .where((message) => message.name.toLowerCase().contains(
                query.toLowerCase(),
              ))
          .toList();
    });
  }

  void _onSearchChanged(String query) {
    if (debounce?.isActive ?? false) debounce!.cancel();

    debounce = Timer(
      const Duration(milliseconds: 300),
      () {
        _filterMessages(query);
      },
    );
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        children: [
          SearchAndFilterBar(
            onChanged: (value) {
              _onSearchChanged(value);
            },
          ),
          const SizedBox(height: 24),
          Expanded(
            child: filteredMessages.isEmpty
                ? const Center(
                    child: Text('No messages found'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        filteredMessages.length,
                        (index) {
                          return Column(
                            children: [
                              ListTile(
                                titleAlignment: ListTileTitleAlignment.top,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredMessages[index].name,
                                      style: AppStyles.style14W600,
                                    ),
                                    Text(
                                      "${filteredMessages[index].specialization} | ${filteredMessages[index].degree}",
                                      style: AppStyles.style10W400.copyWith(
                                        color: const Color(0xff616161),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                                subtitle: Text(
                                  filteredMessages[index].message,
                                  style: AppStyles.style12W400.copyWith(
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                leading: CircleAvatar(
                                  radius: 24,
                                  backgroundImage: AssetImage(
                                    filteredMessages[index].image,
                                  ),
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      filteredMessages[index].time,
                                      style: AppStyles.style12W400,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: filteredMessages[index].isUnread
                                            ? AppColors.primary
                                            : AppColors.white,
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          start: 6.5,
                                          end: 6.5,
                                          top: 2.5,
                                          bottom: 2.5,
                                        ),
                                        child: Text(
                                          filteredMessages[index]
                                              .numberOfUnreadMessages!,
                                          style: AppStyles.style10W400.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: AppColors.textFieldBorder,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
