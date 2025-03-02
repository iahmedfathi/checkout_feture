import 'package:checkout_feature/core/errors/exceptions.dart';
import 'package:checkout_feature/core/utils/stripe_service.dart';
import 'package:checkout_feature/features/checkout/data/models/payment_intent_input.dart';
import 'package:checkout_feature/features/checkout/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});
  @override
  Future<Either<String, void>> makePayMent(
      {required PaymentIntentInputModel paymentInputModel}) async {
    try {
      await stripeService.makePaymentSheet(
          paymentInputModel: paymentInputModel);
      return Right(null);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    }
  }
}
