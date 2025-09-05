import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 24,
        ),
        CustomTextFormField(
            hintText: 'الاسم كامل', textInputType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'البريد الإلكتروني',
            textInputType: TextInputType.emailAddress),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'العنوان', textInputType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'المدينه', textInputType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            textInputType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'رقم الهاتف', textInputType: TextInputType.phone),
        SizedBox(
          height: 16,
        ),
        SaveAddressToggle()
      ],
    );
  }
}

class SaveAddressToggle extends StatelessWidget {
  const SaveAddressToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 28,
          decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(50),
              )),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 16,
              width: 16,
              decoration: const ShapeDecoration(
                  color: Colors.white, shape: OvalBorder()),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          'حفظ العنوان',
          style: TextStyles.semiBold13.copyWith(color: const Color(0xff949D9E)),
        )
      ],
    );
  }
}
