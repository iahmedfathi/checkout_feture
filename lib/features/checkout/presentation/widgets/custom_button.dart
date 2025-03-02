import 'package:checkout_feature/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, this.isLoading = false});
  final void Function()? onPressed;
  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff34A853),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
          onPressed: onPressed,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text(
                  text,
                  style: AppStyles.medium22,
                )),
    );
  }
}
