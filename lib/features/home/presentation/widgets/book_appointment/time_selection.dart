import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class AvailableTimeSelection extends StatefulWidget {
  const AvailableTimeSelection({super.key});

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
          height: MediaQuery.of(context).size.height * 0.22,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
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
