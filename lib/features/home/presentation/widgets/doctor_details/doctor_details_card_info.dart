import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctordetailsCardInfo extends StatelessWidget {
  const DoctordetailsCardInfo({
    super.key,
    required this.image,
    required this.rating,
    required this.specialization,
    required this.degree,
    required this.name,
  });

  final String name, image, rating, specialization, degree;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(12),
          child: Image.asset(
            image,
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
                name,
                style: AppStyles.style16W700,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                '$specialization | $degree',
                style: AppStyles.style12W500,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppColors.ratingStart,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: AppStyles.style12W500,
                  ),
                ],
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
