import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/core/utils/app_colors.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub/features/checkout/domain/entities/order_entity.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection(
      {super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    var shippingAddress = context.read<OrderEntity>().shippingAddressEntity;
    return SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.fullName = value;
                  },
                  hintText: 'الاسم كامل',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.email = value;
                  },
                  hintText: 'البريد الإلكتروني',
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.address = value;
                  },
                  hintText: 'العنوان',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.city = value;
                  },
                  hintText: 'المدينه',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.addressDetails = value;
                  },
                  hintText: 'رقم الطابق , رقم الشقه ..',
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    shippingAddress.phone = value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.phone),
              const SizedBox(
                height: 16,
              ),
              const SaveAddressToggle()
            ],
          ),
        ),
      ),
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
