import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/presentation/widgets/notification/notifaction_app_bar.dart';
import 'package:flutter/material.dart';

class MedicalRecordView extends StatelessWidget {
  const MedicalRecordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: "Medical Record",
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "This Month",
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "End of observation",
                style: AppStyles.style14W600,
              ),
              leading: Text(
                "Feb 25",
                style: AppStyles.style14W400,
              ),
            ),
            const ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "Blood Analysis",
                style: AppStyles.style14W600,
              ),
              subtitle: Text(
                "red blood cell : 4.10 million cells/mcL\nhemogoblin : 142 grams/L\nhematocrit : 33.6%\nwhite blood cells : 3.850 cells/mcL",
                style: AppStyles.style12W400,
              ),
              leading: Text(
                "Feb 25",
                style: AppStyles.style14W400,
              ),
            ),
            const ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "Blood Analysis",
                style: AppStyles.style14W600,
              ),
              subtitle: Text(
                "red blood cell : 4.55 million cells/mcL\nhemogoblin : 140 grams/L\nhematocrit : 42.6%\nwhite blood cells : 6.000 cells/mcL",
                style: AppStyles.style12W400,
              ),
              leading: Text(
                "Feb 12",
                style: AppStyles.style14W400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "January",
              style: AppStyles.style16W600.copyWith(
                color: AppColors.black2,
              ),
            ),
            const SizedBox(height: 10),
            const ListTile(
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "End of observation",
                style: AppStyles.style14W600,
              ),
              leading: Text(
                "Jan 28",
                style: AppStyles.style14W400,
              ),
            ),
            const ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "Blood Analysis",
                style: AppStyles.style14W600,
              ),
              subtitle: Text(
                "red blood cell : 4.2 million cells/mcL\nhemogoblin : 130 grams/L\nhematocrit : 39.5%\nwhite blood cells : 5.500 cells/mcL",
                style: AppStyles.style12W400,
              ),
              leading: Text(
                "Jan 28",
                style: AppStyles.style14W400,
              ),
            ),
            const ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              contentPadding: EdgeInsetsDirectional.zero,
              dense: true,
              title: Text(
                "Blood Analysis",
                style: AppStyles.style14W600,
              ),
              subtitle: Text(
                "red blood cell : 4.35 million cells/mcL\nhemogoblin : 135 grams/L\nhematocrit : 41.0%\nwhite blood cells : 4.800 cells/mcL",
                style: AppStyles.style12W400,
              ),
              leading: Text(
                "Jan 25",
                style: AppStyles.style14W400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
