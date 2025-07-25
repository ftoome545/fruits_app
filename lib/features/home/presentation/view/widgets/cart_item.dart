import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_network_image.dart';
import 'package:fruits_hub/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_item/cart_item_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log("Item update it successfully");
        return IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 73,
                height: 92,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: CustomeNetworkImage(
                    imageUrl: cartItemEntity.productEntity.imageUrl!),
              ),
              const SizedBox(
                width: 17,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              context
                                  .read<CartCubit>()
                                  .deleteCarItem(cartItemEntity);
                            },
                            child: SvgPicture.asset(Assets.imagesTrash)),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateTotalWeight()} كم',
                      style: TextStyles.regular13
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                    Row(
                      children: [
                        CartItemActionButtons(
                          cartItemEntity: cartItemEntity,
                        ),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: TextStyles.bold16
                              .copyWith(color: AppColors.secondaryColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
