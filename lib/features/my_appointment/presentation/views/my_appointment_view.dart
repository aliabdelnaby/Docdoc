import '../widgets/search_trailing_appbar.dart';
import '../../../home/presentation/widgets/notification/notifaction_app_bar.dart';
import '../widgets/my_appointment_view_body.dart';
import 'package:flutter/material.dart';

class MyAppointmentView extends StatelessWidget {
  const MyAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "My Appointments",
        trailing: const SearchTrailingAppBar(),
      ),
      body: const MyAppointmentViewBody(),
    );
  }
}
