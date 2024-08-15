import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/appointment_type.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/select_date_widget.dart';
import 'package:docdoc/features/home/presentation/widgets/book_appointment/time_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class DateAndTimePage extends StatelessWidget {
  const DateAndTimePage({super.key});

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
                    onChanged: (date) {},
                    onConfirm: (date) {},
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
          const AvailableTimeSelection(),
          const SizedBox(height: 24),
          Text(
            'Appointment Type',
            style: AppStyles.style16W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          const SizedBox(height: 14),
          AppointmentType(
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
