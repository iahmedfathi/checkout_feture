import 'package:checkout_feature/features/checkout/presentation/widgets/build_app_bar.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/my_cart_body.dart';

import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar( text: 'My Cart'),
      body:MyCartBody()
    );
  }
}
