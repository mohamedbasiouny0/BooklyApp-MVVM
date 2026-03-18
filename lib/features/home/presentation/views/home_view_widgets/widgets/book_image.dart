
import 'package:flutter/material.dart';
import 'package:test2/core/utils/assets.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: ClipRRect(
        borderRadius: .circular(20),
        child: Image.asset(Assets.testImage, fit: .fill),
      ),
    );
  }
}
