import 'package:flutter/material.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/active_step_item.dart';
import 'package:fruits_hub/features/checkout/presentation/view/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.text,
      required this.index,
      required this.isActive});
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: ActiveStepItem(text: text),
        secondChild: InActiveStepItem(text: text, index: index),
        crossFadeState:
            isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300));
  }
}
