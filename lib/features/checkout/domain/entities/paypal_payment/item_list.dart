import 'package:fruits_hub/features/checkout/domain/entities/paypal_payment/item.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(items: items.map((e) => ItemEntity.fromEntity(e)).toList());
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
