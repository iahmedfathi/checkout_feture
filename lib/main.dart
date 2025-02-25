import 'package:checkout_feature/features/checkout/presentation/views/my_card_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutFeature());
}

class CheckoutFeature extends StatelessWidget {
  const CheckoutFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCardView(),
    );
  }
}
