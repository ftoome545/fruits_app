import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/payment_item.dart';

class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
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
                  '150 جنيه',
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
                  '180 جنيه',
                  style: TextStyles.bold16
                      .copyWith(color: const Color(0xFF0C0D0D)),
                ),
              ],
            )
          ],
        ));
  }
}
