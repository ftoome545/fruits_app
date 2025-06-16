import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/helper_functions/get_dummy_products.dart';
import 'package:fruits_hub/core/widgets/custom_error_widget.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatefulWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  State<BestSellingGridViewBlocBuilder> createState() =>
      _BestSellingGridViewBlocBuilderState();
}

class _BestSellingGridViewBlocBuilderState
    extends State<BestSellingGridViewBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGridView(
            products: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.errMessage));
        } else {
          return Skeletonizer.sliver(
              enabled: true,
              child: BestSellingGridView(
                products: getDummyProducts(),
              ));
        }
      },
    );
  }
}
