import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import 'appointment_type.dart';
import 'select_date_widget.dart';
import 'time_selection.dart';

class DateAndTimePage extends StatelessWidget {
  const DateAndTimePage({
    super.key,
    this.onDateTimeChanged,
    this.onDateTimeConfirm, required this.onNoteChanged,
  });

  final dynamic Function(DateTime)? onDateTimeChanged;
  final dynamic Function(DateTime)? onDateTimeConfirm;
  final void Function(String) onNoteChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Date',
                style: AppStyles.style16W600.copyWith(
                  color: AppColors.black2,
                ),
              ),
              InkWell(
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime(2025, 1, 1),
                    onChanged: onDateTimeChanged,
                    onConfirm: onDateTimeConfirm,
                    currentTime: DateTime.now(),
                    locale: LocaleType.en,
                  );
                },
                child: Text(
                  'Set Manual',
                  style: AppStyles.style12W500.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SelectDateWidget(
            onDateChange: (value) {},
          ),
          const SizedBox(height: 24),
          AvailableTimeSelection(
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),
          Text(
            'Appointment Type',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 14),
          AppointmentType(
            onChanged: onNoteChanged,
          ),
        ],
      ),
    );
  }
}
