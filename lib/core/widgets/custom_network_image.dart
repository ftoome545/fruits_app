import 'package:flutter/material.dart';

class CustomeNetworkImage extends StatelessWidget {
  const CustomeNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
