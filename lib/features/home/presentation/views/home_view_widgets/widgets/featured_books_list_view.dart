import 'package:flutter/material.dart';

import 'book_image.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const .symmetric(horizontal: 8),
          child: BookImage(),
        ),
      ),
    );
  }
}
