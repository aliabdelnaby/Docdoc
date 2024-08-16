import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CreateNewMsgAppBar extends StatelessWidget {
  const CreateNewMsgAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.black2,
              size: 27,
            ),
          ),
          Text(
            "Create New Message",
            style: AppStyles.style18W600.copyWith(
              color: AppColors.black2,
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
