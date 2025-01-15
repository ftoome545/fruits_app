import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/features/onBoarding/persentation/view/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const <Widget>[
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          title: Row(
            children: [
              Text("مرحبا بك في "),
              Text("Fruits"),
              Text("HUB"),
            ],
          ),
        )
      ],
    );
  }
}
