import 'package:checkout_feature/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.regular18,
        ),
        Text(
          price,
          style: AppStyles.regular18,
        ),
      ],
    );
  }
}
