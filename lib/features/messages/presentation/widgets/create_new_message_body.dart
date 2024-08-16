import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/core/utils/assets.dart';
import 'package:docdoc/features/home/presentation/widgets/recommendation_doctor/search_and_filter_bar.dart';
import 'package:docdoc/features/messages/presentation/widgets/create_new_msg_app_bar.dart';
import 'package:flutter/material.dart';

class CreateNewMessageBody extends StatelessWidget {
  const CreateNewMessageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(17),
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      child: Column(
        children: [
          const CreateNewMsgAppBar(),
          const SizedBox(height: 32),
          SearchAndFilterBar(
            onChanged: (value) {},
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
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
                          title: const Text(
                            'Dr. John Doe',
                            style: AppStyles.style14W600,
                          ),
                          subtitle: Text(
                            'General Doctor | RSUD Gatot Subroto',
                            style: AppStyles.style10W400.copyWith(
                              color: const Color(0xff616161),
                            ),
                          ),
                          leading: const CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(
                              Assets.imagesDoctor1,
                            ),
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
          ),
        ],
      ),
    );
  }
}
