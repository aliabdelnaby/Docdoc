import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:flutter/material.dart';

class MessagesViewBody extends StatelessWidget {
  const MessagesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        children: [
          const SearchAndFilterBar(),
          const SizedBox(height: 24),
          Expanded(
            child: Column(
              children: List.generate(
                5,
                (index) {
                  return Column(
                    children: [
                      ListTile(
                        titleAlignment: ListTileTitleAlignment.top,
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dr. Randy Wigham',
                              style: AppStyles.style14W600,
                            ),
                            Text(
                              "General Doctor | RSUD Gatot Subroto",
                              style: AppStyles.style10W400.copyWith(
                                color: const Color(0xff616161),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                        subtitle: Text(
                          "Fine, I'll do a check. Does the patient have a history of certain diseases?",
                          style: AppStyles.style12W400.copyWith(
                            color: AppColors.textGrey,
                          ),
                        ),
                        leading: const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(
                            Assets.imagesDoctor1,
                          ),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '11:30 AM',
                              style: AppStyles.style12W400,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.primary,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 6.5,
                                  end: 6.5,
                                  top: 2.5,
                                  bottom: 2.5,
                                ),
                                child: Text(
                                  '2',
                                  style: AppStyles.style10W400.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: AppColors.textFieldBorder,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
