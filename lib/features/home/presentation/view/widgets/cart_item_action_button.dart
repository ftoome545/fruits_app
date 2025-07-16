import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          color: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increasCount();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            cartItemEntity.count.toString(),
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          icon: const Icon(
            Icons.remove,
            color: Colors.grey,
          ),
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartItemEntity.decreasCount();
          },
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.onPressed});
  final Icon icon;
  final Color color;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 24,
            width: 24,
            decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                )),
            child: icon,
          ),
        ),
      ],
    );
  }
}
