import 'package:checkout_feature/features/checkout/presentation/widgets/build_app_bar.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/thank_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(text: ''),body: ThankViewBody(
      
    ),);
  }
}
