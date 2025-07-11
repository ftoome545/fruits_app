import 'package:flutter/material.dart';
import 'package:fruits_hub/core/utils/app_text_style.dart';
import 'package:fruits_hub/core/widgets/notification_widget.dart';

AppBar buildAppBar(
    {required BuildContext context,
    required String title,
    bool showBackButton = true,
    bool showNotificationIcon = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.arrow_back_ios),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
    actions: [
      Visibility(
        visible: showNotificationIcon,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      )
    ],
  );
}
