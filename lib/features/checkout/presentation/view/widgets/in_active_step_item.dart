import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xffF2F3F3),
            child: Text(
              '2',
              style: TextStyles.semiBold13
                  .copyWith(color: const Color(0xff0C0D0D)),
            )),
        const SizedBox(
          width: 4,
        ),
        Text(
          'الشحن',
          style: TextStyles.semiBold13.copyWith(color: const Color(0xffAAAAAA)),
        )
      ],
    );
  }
}
