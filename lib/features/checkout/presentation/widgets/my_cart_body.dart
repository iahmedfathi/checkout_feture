import 'package:checkout_feature/features/checkout/presentation/views/payment_details_view.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/order_price.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/total_price.dart';
import 'package:flutter/material.dart';

class MyCartBody extends StatelessWidget {
  const MyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/Group 7.png")),
          SizedBox(
            height: 25,
          ),
          OrderPrice(title: 'Order Subtotal', price: r'$42.97'),
          OrderPrice(title: 'Discount', price: r'$0'),
          OrderPrice(title: 'Shipping', price: r'$8'),
          Divider(
            height: 34,
            color: Color(0xffC7C7C7),
            indent: 15,
            endIndent: 15,
          ),
          TotalPrice(
            title: 'Total',
            price: r'$50.97',
          ),
          SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PaymentDetailsView()));
            },
          ),
          SizedBox(
            height: 25,
          ),SizedBox()
        ],
      ),
    );
  }
}
