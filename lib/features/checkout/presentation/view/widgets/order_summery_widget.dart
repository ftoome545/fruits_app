import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_images.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/payment_item.dart';

class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PaymentItem(
            title: 'ملخص الطلب :',
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'المجموع الفرعي :',
                      style: TextStyles.regular13
                          .copyWith(color: const Color(0xFF4E5556)),
                    ),
                    const Spacer(),
                    Text(
                      '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                      style: TextStyles.semiBold16
                          .copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'التوصيل  :',
                      style: TextStyles.regular13
                          .copyWith(color: const Color(0xFF4E5556)),
                    ),
                    const Spacer(),
                    Text(
                      '30جنية',
                      style: TextStyles.semiBold13
                          .copyWith(color: const Color(0xFF4E5556)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                const Divider(
                  thickness: .50,
                  color: Color(0xFFCACECE),
                ),
                const SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text(
                      'الكلي',
                      style: TextStyles.bold16
                          .copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                    const Spacer(),
                    Text(
                      '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                      style: TextStyles.bold16
                          .copyWith(color: const Color(0xFF0C0D0D)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          PaymentItem(
              title: 'عنوان التوصيل:',
              child: Row(
                children: [
                  SvgPicture.asset(Assets.imagesLocationIcon),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    context
                        .read<OrderEntity>()
                        .shippingAddressEntity
                        .toString(),
                    style: TextStyles.regular16
                        .copyWith(color: const Color(0xFF4E5556)),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        pageController.animateToPage(
                            pageController.page!.toInt() - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.bounceIn);
                      },
                      child: SvgPicture.asset(Assets.imagesEditIcon)),
                ],
              ))
        ],
      ),
    );
  }
}
