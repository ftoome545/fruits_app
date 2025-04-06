import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/search_text_field.dart';
import 'package:fruits_hub/features/auth/peresntation/views/widgets/featured_list.dart';
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
            ],
          )),
        ],
      ),
    );
  }
}

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: TextStyles.bold16.copyWith(color: const Color(0xff0C0D0D)),
        ),
        const Spacer(),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: const Color(0xff949D9E)),
        )
      ],
    );
  }
}
