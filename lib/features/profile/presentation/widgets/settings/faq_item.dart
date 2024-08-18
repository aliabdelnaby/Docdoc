import 'package:docdoc/core/utils/app_colors.dart';
import 'package:docdoc/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class FAQItem extends StatefulWidget {
  const FAQItem({super.key, required this.index});
final int index;
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
              "What should I expect during a doctor's appointment?",
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
                "During a doctor's appointment, you can expect to discuss your medical history, current symptoms or concerns, and any medications or treatments you are taking. The doctor will likely perform a physical exam and may order additional tests or procedures if necessary.",
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
