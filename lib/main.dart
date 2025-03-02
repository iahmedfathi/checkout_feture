import 'package:checkout_feature/core/api/end_pointes.dart';
import 'package:checkout_feature/features/checkout/presentation/views/my_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKey.publishableKey;

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

/*we have 3 steps to create stripe
1) create payment intent (amount,currency);
2)initialize payment sheet(paymentIntentClientSecret);
3)present the payment sheet()





*/
/*
  Future<void> initPaymentSheet(String? paymentIntentClientSecret) async {
    try {
      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: '',
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }
}*/
