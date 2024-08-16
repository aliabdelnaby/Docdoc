import 'dart:async';
import '../../../home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import '../../data/datasource/messages_list.dart';
import '../../data/models/message_item_model.dart';
import 'create_new_msg_app_bar.dart';
import 'new_msg_doctors_list.dart';
import 'package:flutter/material.dart';

class CreateNewMessageBody extends StatefulWidget {
  const CreateNewMessageBody({super.key});

  @override
  State<CreateNewMessageBody> createState() => _CreateNewMessageBodyState();
}

class _CreateNewMessageBodyState extends State<CreateNewMessageBody> {
  List<MessageItemModel> filteredDoctors = [];
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    filteredDoctors = messagesList;
  }

  void _filterMessages(String query) {
    setState(() {
      filteredDoctors = messagesList
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
    return Container(
      padding: const EdgeInsetsDirectional.all(17),
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: Column(
        children: [
          const CreateNewMsgAppBar(),
          const SizedBox(height: 32),
          SearchAndFilterBar(
            onChanged: (value) {
              _onSearchChanged(value);
            },
          ),
          const SizedBox(height: 24),
          Expanded(
            child: filteredDoctors.isEmpty
                ? const Center(
                    child: Text('No doctors found'),
                  )
                : NewMsgDoctorsList(filteredDoctors: filteredDoctors),
          ),
        ],
      ),
    );
  }
}
