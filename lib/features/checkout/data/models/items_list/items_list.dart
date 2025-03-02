import 'item.dart';

class ItemsList {
  List<OrderItemModel>? orders;

  ItemsList({this.orders});

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
        orders: (json['items'] as List<dynamic>?)
            ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'items': orders?.map((e) => e.toJson()).toList(),
      };
}
