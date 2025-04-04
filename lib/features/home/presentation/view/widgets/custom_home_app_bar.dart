import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(
          color: const Color(0xff949D9E),
        ),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        textAlign: TextAlign.right,
        style: TextStyles.bold16.copyWith(
          color: const Color(0xff0C0D0D),
        ),
      ),
      trailing: Container(
          padding: const EdgeInsets.all(12),
          decoration: const ShapeDecoration(
              color: Color(0xffEEF8ED), shape: OvalBorder()),
          child: SvgPicture.asset(Assets.imagesNotification)),
    );
  }
}
