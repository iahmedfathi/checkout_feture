import 'dart:developer';

import 'package:checkout_feature/features/checkout/data/models/payment_intent_input.dart';
import 'package:checkout_feature/features/checkout/data/repos/checkout_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of<PaymentCubit>(context);
  final CheckoutRepo checkoutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentInputModel}) async {
    emit(PaymentLoading());
    final result =
        await checkoutRepo.makePayMent(paymentInputModel: paymentInputModel);
    result.fold(
      (error) => emit(PaymentFailure(errorMessage: error)),
      (_) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
