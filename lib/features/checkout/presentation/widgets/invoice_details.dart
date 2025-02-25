import 'package:checkout_feature/features/checkout/presentation/widgets/thanks_info.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';

class InvoiceDetails extends StatelessWidget {
  const InvoiceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ThanksInfo(title: 'Date', price: "01/24/2023"),
          ThanksInfo(title: 'Time', price: "10:15 AM"),
          ThanksInfo(title: 'To', price: "Sam Louis"),
          Divider(
            height: 50,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          TotalPrice(title: 'Total', price: r'$50.97')
        ],
      ),
    );
  }
}
