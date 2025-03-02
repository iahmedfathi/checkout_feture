import 'package:checkout_feature/core/api/api_consumer.dart';

import 'package:checkout_feature/core/api/end_pointes.dart';
import 'package:checkout_feature/features/checkout/data/models/customers_model.dart';
import 'package:checkout_feature/features/checkout/data/models/payment_intent_input.dart';
import 'package:checkout_feature/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiConsumer apiConsumer;

  StripeService({required this.apiConsumer});

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentInputModel) async {
    final response = await apiConsumer.post(EndPoint.paymentIntents,
        data: paymentInputModel.toJson());
    final paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'App Store',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future<void> diPlayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePaymentSheet(
      {required PaymentIntentInputModel paymentInputModel}) async {
    var paymentIntentInputModel = await createPaymentIntent(paymentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentInputModel.clientSecret!);
    await diPlayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomers(
      CustomersModel customersModel) async {
    final response = await apiConsumer.post(EndPoint.customers,
        data: customersModel.toJson());
    final paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;
  }
}
