import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPayment {
  Amount? amount;
  String? description;
  ItemList? itemList;

  PaypalPayment({this.amount, this.description, this.itemList});

  factory PaypalPayment.fromEntity(OrderEntity entity) {
    return PaypalPayment(
      amount: Amount.fromEntity(entity),
      description: 'Payment description',
      itemList: ItemList.fromEntity(items: entity.cartEntity.cartItems),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount?.toJson(),
        'description': description,
        'item_list': itemList?.toJson(),
      };
}
