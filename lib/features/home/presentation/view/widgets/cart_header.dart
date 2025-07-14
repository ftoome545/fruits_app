import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFEBF9F1),
      ),
      child: Center(
        child: Text(
            'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
            style: TextStyles.regular13.copyWith(
              color: AppColors.primaryColor,
            )),
      ),
    );
  }
}
