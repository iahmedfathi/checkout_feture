import 'package:checkout_feature/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({required String text}) {
  return AppBar(
    leading: Center(
        child: SvgPicture.asset(
      "assets/images/Arrow 1.svg",
      height: 24,
    )),
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Text(
      text,
      style: AppStyles.medium25,
    ),
    centerTitle: true,
  );
}
