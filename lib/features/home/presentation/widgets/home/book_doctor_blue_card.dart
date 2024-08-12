import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';

class BookDoctorBlueCard extends StatelessWidget {
  const BookDoctorBlueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 197,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 167,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(24),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesBlueCardBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: AppStyles.style18W500,
                  textAlign: TextAlign.start,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(48),
                    ),
                  ),
                  child: Text(
                    "Find Nearby",
                    style: AppStyles.style12W400.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 15,
            child: Image.asset(
              Assets.imagesFemileDoctor,
              height: 197,
            ),
          ),
        ],
      ),
    );
  }
}
