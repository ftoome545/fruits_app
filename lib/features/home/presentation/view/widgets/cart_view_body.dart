import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/cart_item_list.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                buildAppBar(
                    context: context,
                    title: 'المنتجات',
                    showNotificationIcon: false),
                const SizedBox(
                  height: kTopPadding,
                ),
                const CartHeader(),
                const SizedBox(
                  height: 24,
                ),
                context.read<CartCubit>().cartEntity.cartItems.isEmpty
                    ? const SizedBox()
                    : const CustomDivider(),
              ],
            )),
            CartItemList(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            )
          ],
        ),
        Positioned(
            left: 16,
            right: 16,
            bottom: MediaQuery.sizeOf(context).height * .05,
            child: const CustomCartButton()),
      ],
    );
  }
}
