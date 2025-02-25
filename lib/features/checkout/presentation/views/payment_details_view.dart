import 'package:checkout_feature/features/checkout/presentation/views/thank_you_view.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/build_app_bar.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_button.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/custom_credit_card.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/model_bottom_sheet.dart';
import 'package:checkout_feature/features/checkout/presentation/widgets/pay_item_list_view.dart';

import 'package:flutter/material.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(text: "Payment Details"),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: PayItemListView(),
            ),
            SliverToBoxAdapter(
              child: CustomCreditCard(
                formKey: formKey,
                autovalidateMode: autovalidateMode,
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    text: "Pay",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      } else {
                        modelBottomSheet(context);
                      }
                    },
                  )),
            )
          ]),
        ));
  }


}
