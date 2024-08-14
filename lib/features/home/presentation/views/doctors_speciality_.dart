import 'package:docdoc/features/home/data/models/specialization_response_model/specialization_response_model.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorsSpeciality extends StatelessWidget {
  const DoctorsSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);
    final extra = state.extra as Map<String, dynamic>?;
    // final Doctor doctor = extra?['doctor'] ?? 'Unknown Details';
    final Specialization specialization =
        extra?['specialization'] ?? 'Unknown Details';
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: specialization.name!,
      ),
      body: Container(),
    );
  }
}
