import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../home/data/datasource/reecommendation_doctor_item_list_model.dart';
import '../../data/models/my_appointment_model/my_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpcomingDoctorCard extends StatelessWidget {
  const UpcomingDoctorCard({
    super.key,
    required this.index,
    required this.item,
  });

  final int index;
  final MyAppointmentModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(12),
          child: Image.asset(
            reecommendationDoctorList.elementAt(index).image,
            fit: BoxFit.cover,
            height: 74,
            width: 74,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.doctor!.name!,
                style: AppStyles.style16W700,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                "${item.doctor!.specialization!.name} Checkup",
                style: AppStyles.style12W500,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                item.appointmentTime!,
                style: AppStyles.style12W500.copyWith(
                  color: const Color(0xff616161),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.imagesNavmessage,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
