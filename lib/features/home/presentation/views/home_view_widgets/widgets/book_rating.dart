import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test2/core/utils/styles.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment,
    required this.rating,
    this.mainAxisSize,
  });

  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: [
        Icon(Icons.star_rounded, color: Colors.amber),
        Gap(4),
        Text(
          '${((rating * 500).truncate() / 100)}',
          style: Styles.style16.copyWith(color: Colors.amber),
        ),
      ],
    );
  }
}
