import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/doctor_speciality_item_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/specialization_response_model/specialization_response_model.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({
    super.key,
    required this.item,
    required this.index,
  });

  final Specialization item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/doctorsSpeciality',
          extra: {
            'specialization': item,
          },
        );
      },
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 80,
              minWidth: 80,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(100),
              color: AppColors.primary.withOpacity(0.05),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(20),
              child: Center(
                child: Image.asset(
                  specialitylList.elementAt(index).image,
                  height: 40,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              item.name!,
              style: AppStyles.style12W400.copyWith(
                color: AppColors.black2,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
