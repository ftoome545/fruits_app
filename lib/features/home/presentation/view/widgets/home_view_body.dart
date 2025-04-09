import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_grid_view.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/best_selling_header.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/featured_list.dart';
import 'package:fruits_hub/features/home/presentation/view/widgets/custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
          BestSellingGridView(),
        ],
      ),
    );
  }
}
