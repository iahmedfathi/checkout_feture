import 'package:checkout_feature/features/checkout/presentation/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PayItemListView extends StatefulWidget {
  const PayItemListView({super.key});

  @override
  State<PayItemListView> createState() => _PayItemListViewState();
}

class _PayItemListViewState extends State<PayItemListView> {
   

  final List<String> payItems = const [
    'assets/images/credit.svg',
    "assets/images/paypal.svg"
  ];int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: payItems.length,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    setState(() {
                      
                    });
                  },
                  child: PaymentItem(
                    isActive: currentIndex == index,
                    image: payItems[index],
                  ),
                ),
              )),
    );
  }
}
