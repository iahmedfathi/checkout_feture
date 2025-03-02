import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button_bloc_consumer.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/pay_item_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 32,
          children: [PayItemListView(), CustomButtonBlocConsumer()],
        ),
      ),
    );
  }
}
