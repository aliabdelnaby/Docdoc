import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/assets.dart';
import 'appointment_type_item.dart';

class AppointmentType extends StatefulWidget {
  const AppointmentType({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<AppointmentType> createState() => _AppointmentTypeState();
}

class _AppointmentTypeState extends State<AppointmentType> {
  String _selectedAppointmentType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appointmentTypeItem(
          title: 'In Person',
          value: 'In Person',
          image: Assets.imagesInperson,
          backgroundColor: AppColors.scheduleChanged,
          groupValue: _selectedAppointmentType,
          onChanged: (value) {
            setState(() {
              _selectedAppointmentType = value!;
            });
            widget.onChanged(value!);
          },
        ),
        Divider(
          color: Colors.grey[200],
        ),
        appointmentTypeItem(
          title: 'Video Call',
          value: 'Video Call',
          image: Assets.imagesVideoCallAppointment,
          backgroundColor: AppColors.videoCallAppointment,
          groupValue: _selectedAppointmentType,
          onChanged: (value) {
            setState(() {
              _selectedAppointmentType = value!;
            });
            widget.onChanged(value!);
          },
        ),
        Divider(
          color: Colors.grey[200],
        ),
        appointmentTypeItem(
          title: 'Phone Call',
          value: 'Phone Call',
          image: Assets.imagesCall,
          backgroundColor: AppColors.white,
          groupValue: _selectedAppointmentType,
          onChanged: (value) {
            setState(() {
              _selectedAppointmentType = value!;
            });
            widget.onChanged(value!);
          },
        ),
        Divider(
          color: Colors.grey[200],
        ),
      ],
    );
  }
}
