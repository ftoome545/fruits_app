import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {}),
          SizedBox(
            width: MediaQuery.sizeOf(context).width -
                (kHorizintalPadding * 2) -
                48,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xFF949D9E),
                      )),
                  TextSpan(
                      text: 'الشروط والأحكام',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xFF2D9F5D),
                      )),
                  const TextSpan(
                    text: ' ',
                    style: TextStyles.semiBold13,
                  ),
                  TextSpan(
                      text: 'الخاصة',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xFF2D9F5D),
                      )),
                  const TextSpan(
                    text: ' ',
                    style: TextStyles.semiBold13,
                  ),
                  TextSpan(
                      text: 'بنا',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xFF2D9F5D),
                      )),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
