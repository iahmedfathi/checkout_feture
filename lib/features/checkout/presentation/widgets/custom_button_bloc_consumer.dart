import 'package:checkout_feature/features/checkout/data/models/payment_intent_input.dart';
import 'package:checkout_feature/features/checkout/presentation/controllers/payment_cubit/payment_cubit.dart';
import 'package:checkout_feature/features/checkout/presentation/functions/execute_paypal_payment.dart';
import 'package:checkout_feature/features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  final int selectedIndex;

  const CustomButtonBlocConsumer({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(duration: Duration(seconds: 3), content: Text(state.errorMessage)),
          );
        }
        if (state is PaymentSuccess) {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThankYouView()),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment Success')),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            if (selectedIndex == 0) {
              // Stripe Payment
              PaymentIntentInputModel paymentInputModel = PaymentIntentInputModel(
                customerId: "cus_RrqKbh3dHslEvW",
                currency: 'usd',
                amount: 100,
              );
              PaymentCubit.get(context).makePayment(paymentInputModel: paymentInputModel);
            } else if (selectedIndex == 1) {
              // PayPal Payment
              var transactionData = getTransactionData();
              executePaypalPayment(context, transactionData);
            }
          },
          isLoading: state is PaymentLoading,
          text: 'Continue',
        );
      },
    );
  }
}
