import '../../../../../core/utils/app_colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
    this.onDateChange,
  });
  final void Function(DateTime)? onDateChange;
  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLine(
      activeColor: AppColors.primary,
      initialDate: DateTime.now(),
      onDateChange: onDateChange,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDMY(),
        showHeader: false,
      ),
      dayProps: EasyDayProps(
        todayStyle: const DayStyle(
          dayStrStyle: TextStyle(
            color: AppColors.hintText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          dayNumStyle: TextStyle(
            color: AppColors.hintText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            color: AppColors.notificationTile,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        inactiveDayStyle: const DayStyle(
          dayStrStyle: TextStyle(
            color: AppColors.hintText,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          dayNumStyle: TextStyle(
            color: AppColors.hintText,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            color: AppColors.notificationTile,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: const DayStyle(
          dayStrStyle: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          dayNumStyle: TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
