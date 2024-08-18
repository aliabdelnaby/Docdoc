import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: "Personal information"),
      body: const Center(
        child: Text('Personal Information'),
      ),
    );
  }
}