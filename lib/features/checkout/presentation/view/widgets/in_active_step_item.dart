import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text, index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xffF2F3F3),
            child: Text(
              index,
              style: TextStyles.semiBold13
                  .copyWith(color: const Color(0xff0C0D0D)),
            )),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyles.semiBold13.copyWith(color: const Color(0xffAAAAAA)),
        )
      ],
    );
  }
}
