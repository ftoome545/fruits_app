import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';

import '../../../../../core/utils/app_text_style.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: FittedBox(
              child: Text(
                'تسوق الان',
                style: TextStyles.bold13.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          )),
    );
  }
}
