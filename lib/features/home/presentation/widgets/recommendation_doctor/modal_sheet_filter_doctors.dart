import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSheetFilterRecommendationDoctors extends StatefulWidget {
  const CustomSheetFilterRecommendationDoctors({super.key});

  @override
  State<CustomSheetFilterRecommendationDoctors> createState() =>
      _CustomSheetFilterRecommendationDoctorsState();
}

class _CustomSheetFilterRecommendationDoctorsState
    extends State<CustomSheetFilterRecommendationDoctors> {
  int _selectedSpecialityIndex = 0; // Initialize to -1 (no selection)
  int _selectedRatingIndex = 0; // Initialize to -1 (no selection)

  void _selectSpeciality(int index) {
    setState(() {
      _selectedSpecialityIndex = index;
    });
  }

  void _selectRating(int index) {
    setState(() {
      _selectedRatingIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsetsDirectional.only(start: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 24),
              child: Align(
                child: Text(
                  'Sort By',
                  style: AppStyles.style18W600.copyWith(
                    color: AppColors.black2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Divider(
              color: AppColors.textFieldBorder,
              thickness: 1.0,
              endIndent: 24,
            ),
            const SizedBox(height: 33.0),
            const Text(
              'Speciality',
              style: AppStyles.style16W500,
            ),
            const SizedBox(height: 24.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    final isSelected = index == _selectedSpecialityIndex;
                    return GestureDetector(
                      onTap: () => _selectSpeciality(index),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 41),
                        margin: const EdgeInsetsDirectional.only(end: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.notificationTile,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          child: Center(
                            child: Text(
                              "General",
                              style: AppStyles.style14W400.copyWith(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.hintText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Rating',
              style: AppStyles.style16W500,
            ),
            const SizedBox(height: 24.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: List.generate(
                  5,
                  (index) {
                    final isSelected = index == _selectedRatingIndex;
                    return GestureDetector(
                      onTap: () => _selectRating(index),
                      child: Container(
                        constraints: const BoxConstraints(minHeight: 41),
                        margin: const EdgeInsetsDirectional.only(end: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.notificationTile,
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: isSelected
                                      ? AppColors.white
                                      : const Color(0xffE0E0E0),
                                ),
                                const SizedBox(width: 6.0),
                                Text(
                                  "${5 - index}",
                                  style: AppStyles.style14W400.copyWith(
                                    color: isSelected
                                        ? AppColors.white
                                        : AppColors.hintText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 52.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  "Done",
                  style: AppStyles.style16W600,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
