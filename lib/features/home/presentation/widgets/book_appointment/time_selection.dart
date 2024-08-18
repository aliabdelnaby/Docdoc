import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AvailableTimeSelection extends StatefulWidget {
  const AvailableTimeSelection({super.key, this.onChanged});
  final ValueChanged<String>? onChanged;

  @override
  State<AvailableTimeSelection> createState() => _AvailableTimeSelectionState();
}

class _AvailableTimeSelectionState extends State<AvailableTimeSelection> {
  List<String> timeSlots = [
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
  ];

  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available time',
          style: AppStyles.style16W600.copyWith(
            color: AppColors.black2,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 3.5,
            ),
            itemCount: timeSlots.length,
            itemBuilder: (context, index) {
              String time = timeSlots[index];
              bool isSelected = time == selectedTime;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTime = time;
                  });
                  widget.onChanged?.call(time);
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.notificationTile,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    time,
                    style: AppStyles.style14W500.copyWith(
                      color: isSelected ? AppColors.white : AppColors.hintText,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
