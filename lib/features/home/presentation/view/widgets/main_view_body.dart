import 'package:flutter/material.dart';
import 'package:fruits_hub/features/home/presentation/view/cart_view.dart';
import 'package:fruits_hub/features/home/presentation/view/products_view.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        SafeArea(child: HomeView()),
        ProductsView(),
        CartView(),
      ],
    );
  }
}
