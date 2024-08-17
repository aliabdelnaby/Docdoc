import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          3,
          (index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 21),
              margin: const EdgeInsetsDirectional.only(top: 15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.04),
                    blurRadius: 30,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appointment done",
                          style: AppStyles.style12W400.copyWith(
                            color: const Color(0xff22C55E),
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                    subtitle: Text(
                      "Wed, 17 May | 08.30 AM",
                      style: AppStyles.style12W500.copyWith(
                        color: const Color(0xff616161),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.more_vert_rounded,
                        color: AppColors.rememberMe,
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.textFieldBorder,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(12),
                        child: Image.asset(
                          Assets.imagesDoctor1,
                          fit: BoxFit.cover,
                          height: 75,
                          width: 75,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Randy Wigham",
                              style: AppStyles.style16W700,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "General Medical Checkup",
                              style: AppStyles.style12W500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.ratingStart,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    "4.8 (4,251 reviews)",
                                    style: AppStyles.style12W500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
