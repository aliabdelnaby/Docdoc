import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/home/data/datasource/doctor_speciality_item_list.dart';
import 'package:docdoc/features/home/data/datasource/reecommendation_doctor_item_list_model.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model/specialization_response_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorSpecialityHomeItem extends StatelessWidget {
  const DoctorSpecialityHomeItem({
    super.key,
    required this.specializationResponseModel,
  });

  final SpecializationResponseModel specializationResponseModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () {
              context.push(
                '/doctorsSpeciality',
                extra: {
                  'specialization':
                      specializationResponseModel.specializations[index],
                  'imageAndRating': reecommendationDoctorList[index],
                },
              );
            },
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24),
              child: Column(
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 56,
                      minWidth: 56,
                    ),
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(100),
                      color: AppColors.greyBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.all(20.0),
                      child: Center(
                        child: Image.asset(
                          specialitylList.elementAt(index).image,
                          height: 28,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    specializationResponseModel.specializations[index].name!,
                    style: AppStyles.style12W400.copyWith(
                      color: AppColors.black2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
