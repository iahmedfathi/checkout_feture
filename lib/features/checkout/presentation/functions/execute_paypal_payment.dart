 import 'dart:developer';

import 'package:checkout_feature/core/api/end_pointes.dart';
import 'package:checkout_feature/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_feature/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_feature/features/checkout/data/models/items_list/item.dart';
import 'package:checkout_feature/features/checkout/data/models/items_list/items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemsList itemsList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKey.clientId,
        secretKey: ApiKey.payPalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": {"items": transactionData.itemsList.toJson()}
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }
    ({AmountModel amount, ItemsList itemsList}) getTransactionData() {
    var amount = AmountModel(
        currency: 'usd',
        total: '100',
        details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0));
    List<OrderItemModel> orders = [
      OrderItemModel(name: 'Apple', quantity: 4, price: '10', currency: 'USD'),
      OrderItemModel(
          name: 'Pineapple', quantity: 5, price: '12', currency: 'USD')
    ];
    var itemsList = ItemsList(orders: orders);

    return (amount: amount, itemsList: itemsList);
  }