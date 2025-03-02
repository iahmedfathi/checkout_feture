import 'package:checkout_feature/features/checkout/data/models/payment_intent_input.dart';
import 'package:dartz/dartz.dart';

abstract class CheckoutRepo {
  Future<Either<String, void>> makePayMent(
      {required PaymentIntentInputModel paymentInputModel});
}
