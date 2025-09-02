import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/widgets/custom_button.dart';
import 'package:fruits_hub/features/checkout/presentation/view/checkout_view.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_item/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CheckoutView.routeName);
            },
            text:
                'الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه');
      },
    );
  }
}
