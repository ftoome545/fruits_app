import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.label,
      required this.onPressed});
  final String image;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(width: 1, color: Color(0xffDDDFDF))),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity:
              const VisualDensity(vertical: VisualDensity.minimumDensity),
          title: Text(
            textAlign: TextAlign.center,
            label,
            style: TextStyles.semiBold16.copyWith(
              color: Colors.black,
            ),
          ),
          leading: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
