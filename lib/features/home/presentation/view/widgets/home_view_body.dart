import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(
                height: kTopPadding,
              ),
              SearchTextField(),
              SizedBox(
                height: 12,
              ),
              FeaturedList(),
              SizedBox(
                height: 12,
              ),
              BestSellingHeader(),
              SizedBox(
                height: 8,
              ),
            ],
          )),
          ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
