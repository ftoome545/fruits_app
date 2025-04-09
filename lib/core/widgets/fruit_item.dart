import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: const Color(0xffF3F5F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          )),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(Assets.imagesWatermelonTest),
                const SizedBox(
                  height: 24,
                ),
                ListTile(
                  title: Text(
                    'بطيخ',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xff0C0D0D),
                    ),
                  ),
                  subtitle: Text.rich(
                      textAlign: TextAlign.right,
                      TextSpan(children: [
                        TextSpan(
                          text: '20جنية',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondaryColor,
                          ),
                        ),
                      ])),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
