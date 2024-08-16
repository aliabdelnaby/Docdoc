import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../data/models/message_item_model.dart';
import 'package:flutter/material.dart';

class NewMsgDoctorsList extends StatelessWidget {
  const NewMsgDoctorsList({
    super.key,
    required this.filteredDoctors,
  });

  final List<MessageItemModel> filteredDoctors;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          filteredDoctors.length,
          (index) {
            var fDoctors = filteredDoctors[index];
            return NewMsgDoctorItem(filteredDoctors: fDoctors);
          },
        ),
      ),
    );
  }
}

class NewMsgDoctorItem extends StatelessWidget {
  const NewMsgDoctorItem({
    super.key,
    required this.filteredDoctors,
  });

  final MessageItemModel filteredDoctors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          contentPadding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          title: Text(
            filteredDoctors.name,
            style: AppStyles.style14W600,
          ),
          subtitle: Text(
            '${filteredDoctors.specialization} | ${filteredDoctors.degree}',
            style: AppStyles.style10W400.copyWith(
              color: const Color(0xff616161),
            ),
          ),
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(
              filteredDoctors.image,
            ),
          ),
        ),
        const Divider(
          color: AppColors.textFieldBorder,
        ),
      ],
    );
  }
}
