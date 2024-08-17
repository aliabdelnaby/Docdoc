import 'package:flutter/material.dart';

class AppointmentViewBody extends StatelessWidget {
  const AppointmentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
