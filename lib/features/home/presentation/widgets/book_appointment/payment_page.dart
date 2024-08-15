import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import 'payment_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPayment = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Option',
            style: AppStyles.style16W600.copyWith(
              color: const Color(0xff070C18),
            ),
          ),
          const SizedBox(height: 16),
          PaymentOptionItem(
            title: 'Credit Card',
            value: 'Master Card',
            groupValue: _selectedPayment,
            onChanged: (value) {
              setState(() {
                _selectedPayment = value!;
              });
              widget.onChanged(value!);
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 35.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.imagesMastercard,
                ),
                const SizedBox(width: 8),
                Text(
                  "Master Card",
                  style: AppStyles.style14W400.copyWith(
                    color: AppColors.black2,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: Color(0xffE0E0E0),
            indent: 35,
            endIndent: 30,
            height: 30,
          ),
          PaymentOptionItem(
            title: 'Bank Transfer',
            value: 'Bank Transfer',
            groupValue: _selectedPayment,
            onChanged: (value) {
              setState(() {
                _selectedPayment = value!;
              });
              widget.onChanged(value!);
            },
          ),
          PaymentOptionItem(
            title: 'Paypal',
            value: 'Paypal',
            groupValue: _selectedPayment,
            onChanged: (value) {
              setState(() {
                _selectedPayment = value!;
              });
              widget.onChanged(value!);
            },
          ),
        ],
      ),
    );
  }
}
