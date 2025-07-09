import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/build_app_bar.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_view_header.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              buildAppBar(
                  context: context, title: 'المنتجات', showBackButton: false),
              const SizedBox(
                height: kTopPadding,
              ),
              const SearchTextField(),
              const SizedBox(
                height: 12,
              ),
              ProductsViewHeader(
                productsLength: context.read<ProductsCubit>().productsLength,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          )),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
