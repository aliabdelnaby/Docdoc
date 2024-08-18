import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:docdoc/features/profile/data/models/static/faq_item_model.dart';
import 'package:flutter/material.dart';

class FAQItem extends StatefulWidget {
  const FAQItem({super.key, required this.item});
  final FAQItemModel item;
  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(
              widget.item.title,
              style: AppStyles.style14W400.copyWith(
                color: AppColors.black2,
              ),
              textAlign: TextAlign.start,
            ),
            trailing: RotationTransition(
              turns: _rotationAnimation,
              child: const Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
            ),
            onExpansionChanged: (bool expanded) {
              setState(() {
                if (expanded) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
            children: [
              Text(
                widget.item.description,
                style: AppStyles.style11W400.copyWith(
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.textFieldBorder,
        ),
      ],
    );
  }
}
