import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel(
      {required this.name,
      required this.code,
      required this.imageUrl,
      required this.price,
      required this.quantity});

  factory OrderProductModel.fromEntity(CartItemEntity cartItemEntity) {
    return OrderProductModel(
        name: cartItemEntity.productEntity.name,
        code: cartItemEntity.productEntity.code,
        imageUrl: cartItemEntity.productEntity.imageUrl!,
        price: cartItemEntity.calculateTotalPrice().toDouble(),
        quantity: cartItemEntity.count);
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
