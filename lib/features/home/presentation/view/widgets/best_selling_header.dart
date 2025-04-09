import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

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
